class Character {
  final String name;
  final String vision;
  final String weapon;
  final String nation;
  final String affiliation;
  final String rarity;
  final String constellation;

  Character({
    required this.name,
    required this.vision,
    required this.weapon,
    required this.nation,
    required this.affiliation,
    required this.rarity,
    required this.constellation,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      vision: json['vision'],
      weapon: json['weapon'],
      nation: json['nation'],
      affiliation: json['affiliation'],
      rarity: json['rarity'].toString(),
      constellation: json['constellation'],
    );
  }
}
