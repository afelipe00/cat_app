import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/repository/models/models.dart';
import 'package:cat_app/repository/services/cat_service.dart';

class CatProvider {
  final CatService _catService;

  CatProvider(CatService catService) : _catService = catService;

  Future<List<CatModel>> fetchCatBreed({
    int limit = 10,
    GetCatMode? order,
    int page = 0,
  }) async {
    try {
      List<Map<String, dynamic>> resp = await _catService.fetchCatBreed(limit: limit, order: order, page: page);
      if (resp.isNotEmpty) {
        final List<CatModel> cats = [];
        for (final cat in resp) {
          cats.add(CatModel.fromJson(cat));
        }
        return cats;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CatModel>> searchCatBreeds(String query) async {
    try {
      final List<BreedModel> breeds = [];
      List<Map<String, dynamic>> resp = await _catService.searchCatBreeds(query);
      for (final breed in resp) {
        breeds.add(BreedModel.fromJson(breed));
      }
      final List<CatModel> cats = [];
      if (breeds.isNotEmpty) {
        for (final breed in breeds) {
          var cat = await _catService.searchCatByBreed(breed.referenceImageId!);
          cats.add(CatModel.fromJson(cat));
        }
      } else {
        return [];
      }
      return cats;
    } catch (e) {
      rethrow;
    }
  }
}
