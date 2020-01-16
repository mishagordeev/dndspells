class Spell {
  final String name;
  final bool concentration;
  final bool ritual;
  final String fullDescription;
  final Map<String, dynamic> level;
  final int mainLevel;
  final String school;

  Spell(
      {this.name,
      this.concentration,
      this.ritual,
      this.fullDescription,
      this.level,
      this.mainLevel,
      this.school});

  factory Spell.get(Map<String, dynamic> json) {
    return new Spell(
        name: json['name'] as String,
        concentration: json['concentration'] as bool,
        ritual: json['ritual'] as bool,
        fullDescription: json['full_description'] as String,
        level: json['level'] as Map<String, dynamic>,
        mainLevel: json['level_main'] as int,
        school: json['school'] as String
    );
  }
}
