import 'package:flutter/material.dart';
import 'styles.dart';
import 'spell/spell.dart';
import 'character_class/character_class.dart';
import 'spell/spell_list/spell_search.dart';
import 'character_class/class_list/class_list.dart';

class App extends StatelessWidget {
  final List<Spell> spells;
  final List<CharacterClass> classes;

  App(this.classes, this.spells);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: Builder(
        builder: (context) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                child: Text("Заклинания", style: appTitleStyle),
                padding: EdgeInsets.only(left: 1.5),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SpellSearch(spells));
                  },
                ),
              ],
            ),
            body: ClassList(classes, spells)
        ),
      ),
    );
  }
}