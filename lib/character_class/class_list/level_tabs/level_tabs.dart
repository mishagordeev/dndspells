import 'package:flutter/material.dart';
import '../../character_class.dart';
import '../../../spell/spell.dart';
import '../../../spell/spell_list/spell_list.dart';
import '../../../styles.dart';
import '../../../spell/spell_list/filtered_spell_list.dart';

void showLevelTabs (CharacterClass characterClass, List<Spell> spells, BuildContext context) {
  List<Widget> tabs = [];
  List<Widget> tabsView = [];

  int firstLevel = 0;
  int maxLevel = characterClass.maxLevel;

  if (!characterClass.hasZeroLevel) {
    firstLevel = 1;
    maxLevel = characterClass.maxLevel + 1;
  }



  for (int level = firstLevel; level < maxLevel; level++) {
    tabs.add(Tab(child: Text("$level-й круг", style: tabTextStyle)));
    List<Spell> filteredSpells = filterSpellList(spells, characterClass, level);
    tabsView.add(SpellList(filteredSpells));
  }

  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return DefaultTabController(
            length: characterClass.maxLevel,
            child: Scaffold(
              appBar: AppBar(
                title: Text(characterClass.name),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: tabs,
                ),
              ),
              body: TabBarView(children: tabsView),
            )
        );
      },
    ),
  );
}
