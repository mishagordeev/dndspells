class Spell {
  Map<String,dynamic> name;
  String image;
  String school;
  bool concentration;
  bool ritual;
  int level;
  List<dynamic> availableFor;
  String castTime;
  String distance;
  String components;
  String duration;
  List<dynamic> description;

  Spell(Map<String, dynamic> jsonItem) {
    name = jsonItem['name'] as Map<String, dynamic>;
    image = jsonItem['image'] as String;
    school = jsonItem['school'] as String;
    concentration = jsonItem['concentration'] as bool;
    ritual = jsonItem['ritual'] as bool;
    level = jsonItem['level'] as int;
    availableFor = jsonItem['available_for'] as List<dynamic>;
    castTime = jsonItem['cast_time'] as String;
    distance = jsonItem['distance'] as String;
    components = jsonItem['components'] as String;
    duration = jsonItem['duration'] as String;
    description = jsonItem['description'] as List<dynamic>;
  }

  static List<Spell> listFrom(List parsedJson) {
    return parsedJson.map<Spell>((jsonItem) {
      return Spell(jsonItem);
    }).toList();
  }
}
