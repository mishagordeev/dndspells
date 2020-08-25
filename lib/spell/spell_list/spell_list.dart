import 'package:flutter/material.dart';

import '../spell.dart';
import 'spell_view/show_spell_view.dart';
import '../../styles.dart';
import 'package:dndspells/constants.dart';

class SpellList extends StatelessWidget {
  final List<Spell> spells;

  SpellList(this.spells);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        itemCount: spells == null ? 0 : spells.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
        itemBuilder: (BuildContext context, int index) {

          Spell spell = spells[index];
          final String hobbyName = spell.name["hobby"];
          final String phantomName = spell.name["phantom"];
          final String englishName = spell.name["english"];

          Widget title = Text(hobbyName, style: spellListTitleStyle);
          Widget subtitle = Text("$phantomName\n$englishName", style: spellListSubtitleStyle);

          String image = spellImagesPath + spell.image;
          
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
}
