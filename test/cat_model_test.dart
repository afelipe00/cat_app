import 'package:cat_app/repository/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("1. Pruebas para el modelo Cat", () {
    test("1. Prueba de modelo Cat sin el submodelo Breed", () {
      // Arrange
      final cat = CatModel(
        id: "1",
        url: "https://cdn2.thecatapi.com/images/1.jpg",
        width: 500,
        height: 500,
      );

      // Act
      final result = cat.toJson();

      // Assert
      expect(result, {
        "id": "1",
        "url": "https://cdn2.thecatapi.com/images/1.jpg",
        "width": 500,
        "height": 500,
        "breeds": [],
      });
    });

    test("2. Prueba del modelo Cat con una sola raza (Breed)", () {
      // Arrange
      final cat = CatModel(
        id: "1",
        url: "https://cdn2.thecatapi.com/images/1.jpg",
        width: 500,
        height: 500,
        breeds: [
          BreedModel(
            id: "1",
            name: "Abyssinian",
            description: "The Abyssinian is easy to care for, and a joy to have in your home.",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            lifeSpan: "14 - 15",
            wikipediaUrl: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
          ),
        ],
      );

      // Act

      // Assert
      expect(cat, isA<CatModel>());
    });

    test("3. Prueba del modelo Cat con varias razas (Breed)", () {
      // Arrange
      final cat = CatModel(
        id: "1",
        url: "https://cdn2.thecatapi.com/images/1.jpg",
        width: 500,
        height: 500,
        breeds: [
          BreedModel(
            id: "1",
            name: "Abyssinian",
            description: "The Abyssinian is easy to care for, and a joy to have in your home.",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            lifeSpan: "14 - 15",
            wikipediaUrl: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
          ),
          BreedModel(
            id: "2",
            name: "Aegean",
            description: "Native to the Greek islands known as the Cyclades in the Aegean Sea.",
            temperament: "Affectionate, Social, Intelligent, Playful, Active",
            origin: "Greece",
            lifeSpan: "9 - 12",
            wikipediaUrl: "https://en.wikipedia.org/wiki/Aegean_cat",
          ),
        ],
      );

      // Act

      // Assert
      expect(cat, isA<CatModel>());
    });
  });
}
