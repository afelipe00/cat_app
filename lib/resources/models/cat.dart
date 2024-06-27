import 'package:cat_app/resources/models/breed.dart';

class Cat {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  final List<Breed>? breeds;

  Cat({
    this.id,
    this.url,
    this.width,
    this.height,
    this.breeds,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      breeds: json['breeds'] != null ? List<Breed>.from(json['breeds'].map((x) => Breed.fromJson(x))) : null,
    );
  }

  Cat copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    List<Breed>? breeds,
  }) {
    return Cat(
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
      'breed': breeds?.map((x) => x.toJson()).toList(),
    };
  }
}
