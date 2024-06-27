import 'package:cat_app/config/constants/enums.dart';
import 'package:cat_app/repository/models/breed_model.dart';
import 'package:cat_app/repository/models/cat_model.dart';
import 'package:cat_app/repository/services/http_service.dart';

class CatService {
  Future<List<CatModel>> getCatBreed({
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
    final List<CatModel> breeds = [];
    for (final breed in response.data) {
      breeds.add(CatModel.fromJson(breed));
    }
    return breeds;
  }

  Future<List<CatModel>> searchCatBreeds(String query) async {
    final List<CatModel> cats = [];
    final response = await HttpService().syncEndpoint(
      method: HttpMethod.get,
      endpoint: '/breeds/search',
      params: {
        'q': query,
        'attach_image': '1',
      },
    );
    final List<BreedModel> breeds = [];
    for (final breed in response.data) {
      breeds.add(BreedModel.fromJson(breed));
    }
    if (breeds.isNotEmpty) {
      for (final breed in breeds) {
        final response = await HttpService().syncEndpoint(
          method: HttpMethod.get,
          endpoint: '/images/${breed.referenceImageId}',
        );
        if (response.data is Map) {
          cats.add(CatModel.fromJson(response.data));
        }
      }
    } else {
      return [];
    }
    return cats;
  }
}
