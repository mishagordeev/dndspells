class Spell {
  final String name;
  final String description;
  final String fullDescription;
  final Map<String, dynamic> level;
  final List<dynamic> attributes;
  final String school;

  Spell(
      {this.name,
      this.description,
      this.fullDescription,
      this.level,
      this.attributes,
      this.school});

  factory Spell.get(Map<String, dynamic> json) {
    return new Spell(
        name: json['name'] as String,
        description: json['description'] as String,
        fullDescription: json['full_description'] as String,
        level: json['level'] as Map<String, dynamic>,
        attributes: json['attributes'] as List<dynamic>,
        school: json['school'] as String
    );
  }
}
