class Spell {
  String name;
  String school;
  bool concentration;
  bool ritual;
  int level;
  List<dynamic> available_for;
  String cast_time;
  String distance;
  String components;
  String duration;
  String description;

  Spell(Map<String, dynamic> jsonItem) {
    name = jsonItem['name'] as String;
    school = jsonItem['school'] as String;
    concentration = jsonItem['concentration'] as bool;
    ritual = jsonItem['ritual'] as bool;
    level = jsonItem['level'] as int;
    available_for = jsonItem['available_for'] as List<dynamic>;
    cast_time = jsonItem['cast_time'] as String;
    distance = jsonItem['distance'] as String;
    components = jsonItem['components'] as String;
    duration = jsonItem['duration'] as String;
    description = jsonItem['description'] as String;
  }

  static List<Spell> listFrom(List parsedJson) {
    return parsedJson.map<Spell>((jsonItem) {
      return Spell(jsonItem);
    }).toList();
  }
}
