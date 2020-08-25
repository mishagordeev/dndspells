import 'package:flutter/material.dart';
import '../../spell/spell_list/spell_list.dart';
import '../../spell/spell.dart';
import 'level_tabs/level_tabs.dart';
import '../character_class.dart';
import '../../styles.dart';

class ClassList extends StatelessWidget {
  final List<CharacterClass> classes;
  final List<Spell> spells;

  ClassList(this.classes, this.spells);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemCount: classes == null ? 0 : classes.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
          itemBuilder: (BuildContext context, int index) {
            CharacterClass characterClass = classes[index];
            return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(characterClass.image)
                ),
                title: Text(characterClass.name, style: classListTitleStyle),
                onTap: () {
                  showLevelTabs(characterClass, spells, context);
                  //LevelTabs(spells, characterClass, context);
                }
            );
          }
      )
    );
  }
}
