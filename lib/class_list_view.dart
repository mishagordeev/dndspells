import 'package:flutter/material.dart';
import 'spell_list_view.dart';
import 'spell/spell.dart';
import 'character_class.dart';

class ClassListView extends StatelessWidget {
  final List<CharacterClass> classes;
  final List<Spell> spells;

  ClassListView(this.spells, this.classes);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemCount: classes == null ? 0 : classes.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
          itemBuilder: (BuildContext context, int index) {
            CharacterClass characterClass = classes[index];
            return new ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(characterClass.image)
                ),
                title: Text(characterClass.name, style: TextStyle (fontWeight: FontWeight.normal, fontSize: 16),),

                onTap: () {
                  showClassSpells(characterClass, context);
                });
          })
    );
  }

  void showClassSpells (CharacterClass characterClass, BuildContext context) {
    List<Widget> tabs = [];
    List<Widget> tabsView = [];

    int start_level = 0;
    int max_level = characterClass.maxLevel;

    if (!characterClass.hasZeroLevel) {
      print("etet");
      start_level = 1;
      max_level = characterClass.maxLevel + 1;
    }
    
    for (int level = start_level; level < max_level; level++) {
      print(start_level.toString() + " " + level.toString() + " " + max_level.toString());
      tabs.add(Tab(child: Text(level.toString() + "-й круг", style: TextStyle(fontSize: 16),),));
      tabsView.add(SpellListView(spells, characterClass.name, level));
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

                body: TabBarView(
                  children: tabsView,
                ),
              )
            );
        },
      ),
    );
  }
}
