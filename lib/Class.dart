class Class {
  String name;
  bool hasZeroLevel;
  String image;
  int maxLevel;

  Class(Map<String, dynamic> jsonItem) {
    this.name = jsonItem['name'] as String;
    this.hasZeroLevel = jsonItem['has_zero_level'] as bool;
    this.image =  jsonItem['image'] as String;
    this.maxLevel = jsonItem['max_level'] as int;
  }
  
  static List<Class> listFrom(List parsedJson) {
    return parsedJson.map<Class>((jsonItem) {
      return Class(jsonItem);
    }).toList();
  }
}
