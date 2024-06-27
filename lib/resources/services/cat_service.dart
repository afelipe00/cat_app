import 'package:cat_app/resources/models/breed.dart';
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

  Future<List<Cat>> searchCatBreeds(String query) async {
    final List<Cat> cats = [];
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/breeds/search',
      params: {
        'q': query,
        'attach_image': '1',
      },
    );
    final List<Breed> breeds = [];
    for (final breed in response.data) {
      breeds.add(Breed.fromJson(breed));
    }
    if (breeds.isNotEmpty) {
      for (final breed in breeds) {
        final response = await HttpService().syncEndpoint(
          method: HttpMethod.get,
          endpoint: '/images/${breed.referenceImageId}',
        );
        if (response.data is Map) {
          cats.add(Cat.fromJson(response.data));
        }
      }
    } else {
      return [];
    }
    return cats;
  }
}
