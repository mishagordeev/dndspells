import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'spell.dart';
import 'spell_view.dart';
import 'styles.dart';

class SpellListView extends StatelessWidget {
  final List<Spell> spells;
  final characterClass;
  final int characterLevel;

  SpellListView(this.spells, this.characterClass, this.characterLevel);

  @override
  Widget build(BuildContext context) {
    const imagesPath = "assets/images/schools/";
    List <Spell> _spells = spells;

    if (characterClass != null && characterLevel != null) {
      _spells = filterSpellList(spells, characterClass, characterLevel);
    }

    return ListView.separated(
        itemCount: _spells == null ? 0 : _spells.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
        itemBuilder: (BuildContext context, int index) {

          Spell spell = _spells[index];
          final String hobbyName = spell.name["hobby"];
          final String phantomName = spell.name["phantom"];
          final String englishName = spell.name["english"];

          Widget title = Text(hobbyName, style: spellListTitleStyle);
          Widget subtitle = Text("$phantomName\n$englishName", style: spellListSubtitleStyle);

          String image = imagesPath + spell.image;
          
          return ListTile(
              leading: ClipRRect(
                child: Image.asset(image, height: 40, width: 40, fit: BoxFit.fitWidth,),
                borderRadius: BorderRadius.circular(2.0),
              ),
              isThreeLine: false,
              title: title,
              subtitle: subtitle,
              contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 8.0),
              onTap: () {
                showSpellView(spell, context);
              }
          );
        }
    );
  }

  List<Spell> filterSpellList (List<Spell> spells, String character_class, int level) {
    List<Spell> filteredSpellList = [];
    
    for (int i = 0; i < spells.length; i++) {
      Spell spell = spells[i];

      if (spell.availableFor.contains(character_class) && level == spell.level) {
        filteredSpellList.add(spell);
      } 
    }
    return filteredSpellList;
  }

  void showSpellView(Spell spell, BuildContext context) {
    List<Widget> actions = [];
    if (spell.ritual) {
      actions.add(
        Container(
          child: Text("Р", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
        ),
      );
    }
    if (spell.concentration) {
      actions.add(
        Container(
          child: Text("К", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
        ),
      );
    }

    String ritual = "";
    if (spell.ritual) {
      ritual = "(ритуал)";
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Column(
                  children: <Widget>[
                    Text(
                      spell.name["hobby"],
                    ),
                    Text(
                      spell.level.toString() + "-й круг, " + spell.school + " " + ritual,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start
                ),
                actions: actions,
                backgroundColor: Colors.red[900]
              ),
              body: SpellView(spell)
          );
        },
      ),
    );
  }
}
