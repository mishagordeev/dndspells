class CharacterClass {
  String name;
  bool hasZeroLevel;
  String image;
  int maxLevel;

  CharacterClass(Map<String, dynamic> jsonItem) {
    this.name = jsonItem['name'] as String;
    this.hasZeroLevel = jsonItem['has_zero_level'] as bool;
    this.image =  jsonItem['image'] as String;
    this.maxLevel = jsonItem['max_level'] as int;
  }
  
  static List<CharacterClass> listFrom(List parsedJson) {
    return parsedJson.map<CharacterClass>((jsonItem) {
      return CharacterClass(jsonItem);
    }).toList();
  }
}
