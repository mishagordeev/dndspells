import 'spell/spell.dart';
import 'character_class.dart';
import 'dart:convert';

List<dynamic> convert(String jsonString, String type) {
  List parsedJson = parse(jsonString);
  if (type == "Class") return CharacterClass.listFrom(parsedJson);
  if (type == "Spell") return Spell.listFrom(parsedJson);
  throw "Can't return";
}

List parse(String jsonString) {
  if (jsonString == null) {
    return [];
  }
  final List parsedJson = json.decode(jsonString);
  if (parsedJson == null)
    return [];
  else
    return parsedJson;
}