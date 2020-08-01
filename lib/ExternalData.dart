import 'Spell.dart';
import 'Class.dart';

class ExternalData {
  String response;
  String type;
  
  List<dynamic> convert(String response, String type) {
    List parsedJson = parse(response);
    if (type == "Class") return Class.listFrom(parsedJson);
    if (type == "Spell") return Spell.listFrom(parsedJson);
    throw "Can't return";
  }
  
  List parse(String response) {
    if (response == null) {
      return [];
    }
    final List parsedJson = json.decode(response);
    if (parsedJson == null)
      return [];
    else
      return parsedJson;
  }
}