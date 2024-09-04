class Commune {
  final String name;
  final String nameFr;

  Commune({required this.name, required this.nameFr});

  factory Commune.fromJson(Map<String, dynamic> json) {
    return Commune(
      name: json['name'],
      nameFr: json['name_fr'],
    );
  }
}

class Wilaya {
  final int wilayaId;
  final String name;
  final String nameFr;
  final List<Commune> communes;

  Wilaya({required this.wilayaId, required this.name, required this.nameFr, required this.communes});

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      wilayaId: json['wilaya_id'],
      name: json['name'],
      nameFr: json['name_fr'],
      communes: (json['communes'] as List).map((e) => Commune.fromJson(e)).toList(),
    );
  }
}
