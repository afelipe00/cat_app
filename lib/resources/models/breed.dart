class Breed {
  final Weight? weight;
  final String? id;
  final String? name;
  final String? cfaUrl;
  final String? vetStreetUrl;
  final String? vcaHospitalsUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String? description;
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalization;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;

  Breed({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetStreetUrl,
    this.vcaHospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalization,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  Breed copyWith({
    Weight? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetStreetUrl,
    String? vcaHospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalization,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
  }) =>
      Breed(
        weight: weight ?? this.weight,
        id: id ?? this.id,
        name: name ?? this.name,
        cfaUrl: cfaUrl ?? this.cfaUrl,
        vetStreetUrl: vetStreetUrl ?? this.vetStreetUrl,
        vcaHospitalsUrl: vcaHospitalsUrl ?? this.vcaHospitalsUrl,
        temperament: temperament ?? this.temperament,
        origin: origin ?? this.origin,
        countryCodes: countryCodes ?? this.countryCodes,
        countryCode: countryCode ?? this.countryCode,
        description: description ?? this.description,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        indoor: indoor ?? this.indoor,
        lap: lap ?? this.lap,
        altNames: altNames ?? this.altNames,
        adaptability: adaptability ?? this.adaptability,
        affectionLevel: affectionLevel ?? this.affectionLevel,
        childFriendly: childFriendly ?? this.childFriendly,
        dogFriendly: dogFriendly ?? this.dogFriendly,
        energyLevel: energyLevel ?? this.energyLevel,
        grooming: grooming ?? this.grooming,
        healthIssues: healthIssues ?? this.healthIssues,
        intelligence: intelligence ?? this.intelligence,
        sheddingLevel: sheddingLevel ?? this.sheddingLevel,
        socialNeeds: socialNeeds ?? this.socialNeeds,
        strangerFriendly: strangerFriendly ?? this.strangerFriendly,
        vocalization: vocalization ?? this.vocalization,
        experimental: experimental ?? this.experimental,
        hairless: hairless ?? this.hairless,
        natural: natural ?? this.natural,
        rare: rare ?? this.rare,
        rex: rex ?? this.rex,
        suppressedTail: suppressedTail ?? this.suppressedTail,
        shortLegs: shortLegs ?? this.shortLegs,
        wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
        hypoallergenic: hypoallergenic ?? this.hypoallergenic,
        referenceImageId: referenceImageId ?? this.referenceImageId,
      );

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        weight: json['weight'] == null ? null : Weight.fromJson(json['weight']),
        id: json['id'],
        name: json['name'],
        cfaUrl: json['cfa_url'],
        vetStreetUrl: json['vetstreet_url'],
        vcaHospitalsUrl: json['vcahospitals_url'],
        temperament: json['temperament'],
        origin: json['origin'],
        countryCodes: json['country_codes'],
        countryCode: json['country_code'],
        description: json['description'],
        lifeSpan: json['life_span'],
        indoor: json['indoor'],
        lap: json['lap'],
        altNames: json['alt_names'],
        adaptability: json['adaptability'],
        affectionLevel: json['affection_level'],
        childFriendly: json['child_friendly'],
        dogFriendly: json['dog_friendly'],
        energyLevel: json['energy_level'],
        grooming: json['grooming'],
        healthIssues: json['health_issues'],
        intelligence: json['intelligence'],
        sheddingLevel: json['shedding_level'],
        socialNeeds: json['social_needs'],
        strangerFriendly: json['stranger_friendly'],
        vocalization: json['vocalisation'],
        experimental: json['experimental'],
        hairless: json['hairless'],
        natural: json['natural'],
        rare: json['rare'],
        rex: json['rex'],
        suppressedTail: json['suppressed_tail'],
        shortLegs: json['short_legs'],
        wikipediaUrl: json['wikipedia_url'],
        hypoallergenic: json['hypoallergenic'],
        referenceImageId: json['reference_image_id'],
      );

  Map<String, dynamic> toJson() => {
        'weight': weight?.toJson(),
        'id': id,
        'name': name,
        'cfa_url': cfaUrl,
        'vetstreet_url': vetStreetUrl,
        'vcahospitals_url': vcaHospitalsUrl,
        'temperament': temperament,
        'origin': origin,
        'country_codes': countryCodes,
        'country_code': countryCode,
        'description': description,
        'life_span': lifeSpan,
        'indoor': indoor,
        'lap': lap,
        'alt_names': altNames,
        'adaptability': adaptability,
        'affection_level': affectionLevel,
        'child_friendly': childFriendly,
        'dog_friendly': dogFriendly,
        'energy_level': energyLevel,
        'grooming': grooming,
        'health_issues': healthIssues,
        'intelligence': intelligence,
        'shedding_level': sheddingLevel,
        'social_needs': socialNeeds,
        'stranger_friendly': strangerFriendly,
        'vocalisation': vocalization,
        'experimental': experimental,
        'hairless': hairless,
        'natural': natural,
        'rare': rare,
        'rex': rex,
        'suppressed_tail': suppressedTail,
        'short_legs': shortLegs,
        'wikipedia_url': wikipediaUrl,
        'hypoallergenic': hypoallergenic,
        'reference_image_id': referenceImageId,
      };
}

class Weight {
  final String? imperial;
  final String? metric;

  Weight({
    this.imperial,
    this.metric,
  });

  Weight copyWith({
    String? imperial,
    String? metric,
  }) =>
      Weight(
        imperial: imperial ?? this.imperial,
        metric: metric ?? this.metric,
      );

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json['imperial'],
        metric: json['metric'],
      );

  Map<String, dynamic> toJson() => {
        'imperial': imperial,
        'metric': metric,
      };
}
