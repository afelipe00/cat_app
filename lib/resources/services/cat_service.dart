import 'package:cat_app/resources/models/cat.dart';
import 'package:cat_app/resources/services/http_service.dart';

class CatService {
  Future<List<Cat>> getCatBreeds() async {
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/images/search',
      params: {
        'limit': '10',
        'page': '0',
        'order': 'RANDOM',
        'size': 'med',
        'mime_types': 'jpg',
        'format': 'json',
        'has_breeds': 'true',
      },
    );
    final List<Cat> breeds = [];
    for (final breed in response.data) {
      breeds.add(Cat.fromJson(breed));
    }
    return breeds;
  }
}
