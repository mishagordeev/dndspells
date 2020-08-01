import 'package:flutter/material.dart';
import 'Spell.dart';
import 'SpellView.dart';

class SpellListView extends StatelessWidget {
  final List<Spell> spells;
  final String character_class;
  final int level;

  SpellListView(this.spells, this.character_class, this.level);

  @override
  Widget build(BuildContext context) {
    List <Spell> _spells;

    if (character_class != null && level != null) {
      _spells = filterSpellList(spells, character_class, level);
    }
    else
      _spells = spells;

    return new ListView.separated(
        itemCount: _spells == null ? 0 : _spells.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
        itemBuilder: (BuildContext context, int index) {
          Spell spell = _spells[index];

          List <Widget> title = [Text(spell.name.hobby)];
          String subtitle = spell.name.phantom + ", " + spell.name.english;
          String image = "assets/images/schools/" + spell.school + ".png";
          
          return new Container(
            child: ListTile(
                leading: Image.asset(image),
                title: Row(
                  children: title
                ),
                subtitle: Text(subtitle),
                onTap: () {
                  showSpellView(spell, context);
                }),
          );
        }
    );
  }

  List<Spell> filterSpellList (List<Spell> spells, String character_class, int level) {
    List<Spell> filteredSpellList = [];
    
    for (int i = 0; i < spells.length; i++) {
      Spell spell = spells[i];

      if (character_class in spell.available_for && level == spell.level) {
        filteredSpellList.add(spell);
      } 
    }
    return filteredSpellList;
  }

  void showSpellView(Spell spell, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  spell.name.hobby, softWrap: true,
                ),
                backgroundColor: 
              ),
              body: SpellView(spell),
          );
        },
      ),
    );
  }
}
