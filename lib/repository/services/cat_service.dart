import 'package:cat_app/config/constants/enums.dart';
import 'package:cat_app/repository/services/http_service.dart';

class CatService {
  Future<List<Map<String, dynamic>>> fetchCatBreed({
    int limit = 10,
    GetCatMode? order,
    int page = 0,
  }) async {
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/images/search',
      params: {
        'limit': limit.toString(),
        'page': page.toString(),
        'order': order == GetCatMode.descendent ? 'DESC' : 'RANDOM',
        'size': 'med',
        'mime_types': 'jpg',
        'format': 'json',
        'has_breeds': 'true',
      },
    );
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<List<Map<String, dynamic>>> searchCatBreeds(String query) async {
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/breeds/search',
      params: {
        'q': query,
        'attach_image': '1',
      },
    );
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> searchCatByBreed(String breedId) async {
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/images/$breedId',
    );
    return Map<String, dynamic>.from(response.data);
  }
}
