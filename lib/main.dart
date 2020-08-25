import 'package:flutter/material.dart';
import 'spell/spell.dart';
import 'character_class/character_class.dart';
import 'external_data.dart';
import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          DefaultAssetBundle.of(context).loadString('assets/classes.json'),
          DefaultAssetBundle.of(context).loadString('assets/spells.json')
        ]),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (!snapshot.hasData) { 
            return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red[900])));
          }

          List<CharacterClass> classes = convert(snapshot.data[0], "Class");
          List<Spell> spells = convert(snapshot.data[1], "Spell");
          return App(classes, spells);
        }
    );
  }
}
