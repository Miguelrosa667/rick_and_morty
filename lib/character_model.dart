class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final String originName;
  final String locationName;
  final List<String> episodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.originName,
    required this.locationName,
    required this.episodes,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
      type: json['type'] == '' ? 'Padrão' : json['type'] ?? 'Padrão',
      gender: json['gender'] ?? 'Unknown',
      image: json['image'] ?? '',
      originName: json['origin']?['name'] ?? 'unknown',
      locationName: json['location']?['name'] ?? 'unknown',
      episodes: List<String>.from(json['episode'] ?? []),
    );
  }
}