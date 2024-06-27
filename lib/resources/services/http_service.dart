import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum HttpMethod { get, post, put, delete }

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final int retryInterval;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryInterval = 1000,
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    var retryCount = err.requestOptions.extra['retryCount'] ?? 0;

    if (retryCount < maxRetries && _shouldRetry(err)) {
      retryCount++;

      await Future.delayed(Duration(milliseconds: retryInterval));

      err.requestOptions.extra['retryCount'] = retryCount;

      try {
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout;
  }
}

class HttpService {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.thecatapi.com/v1',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': dotenv.env['API_KEY'] ?? '',
    },
  ));

  Future<Response> syncEndpoint({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    Response response;
    final uri = Uri(path: endpoint, queryParameters: params);
    debugInterceptor();
    switch (method) {
      case HttpMethod.get:
        response = await dio.getUri(uri, data: data);
        break;
      case HttpMethod.post:
        response = await dio.postUri(uri, data: data);
        break;
      case HttpMethod.put:
        response = await dio.putUri(uri, data: data);
        break;
      case HttpMethod.delete:
        response = await dio.deleteUri(uri, data: data);
        break;
      default:
        throw Exception('Invalid HTTP method');
    }
    return response;
  }

  void debugInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // Esto se ejecuta antes de enviar la petición
        print('Petición: ${options.method} ${options.uri}');
        print('Headers enviados: ${options.headers}');
        print('Parametros enviados: ${options.queryParameters}');
        print('Body enviado: ${options.data}');
        // Permitir continuar con la petición
        return handler.next(options); // continue
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Esto se ejecuta cuando se recibe una respuesta
        print('Respuesta recibida: ${response.statusCode}');
        print('Headers de la respuesta: ${response.headers}');
        print('Datos de la respuesta: ${response.data}');
        // Permitir continuar con la respuesta
        return handler.next(response); // continue
      },
      onError: (DioError e, ErrorInterceptorHandler handler) {
        // Esto se ejecuta cuando ocurre un error
        print('Error en la petición: ${e.message}');
        if (e.response != null) {
          print('Headers de la respuesta con error: ${e.response?.headers}');
          print('Datos de la respuesta con error: ${e.response?.data}');
        }
        // Permitir continuar con el error
        return handler.next(e); // continue
      },
    ));
  }
}
