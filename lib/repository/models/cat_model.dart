import 'package:cat_app/repository/models/breed_model.dart';

class CatModel {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  final List<BreedModel> breeds;

  CatModel({
    this.id,
    this.url,
    this.width,
    this.height,
    this.breeds = const [],
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      breeds: json['breeds'] != null ? List<BreedModel>.from(json['breeds'].map((x) => BreedModel.fromJson(x))) : [],
    );
  }

  CatModel copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    List<BreedModel>? breeds,
  }) {
    return CatModel(
      id: id ?? this.id,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      breeds: breeds ?? this.breeds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
      'breed': breeds.map((x) => x.toJson()).toList(),
    };
  }
}
