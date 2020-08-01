import 'package:flutter/material.dart';
import 'SpellListView.dart';
import 'Spell.dart';
import 'Class.dart';

class ClassListView extends StatelessWidget {
  final List<Class> classes;
  final List<Spell> spells;

  ClassListView(this.spells, this.classes);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemCount: classes == null ? 0 : classes.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
          itemBuilder: (BuildContext context, int index) {
            Class character_class = classes[index];
            return new ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                leading: Image.asset(character_class.image),
                title: Text(character_class.name),
                onTap: () {
                  showClassSpells(character_class, contest);
                });
          })
    );
  }

  void showClassSpells (Class character_class, BuildContext context) {
    List<Widget> tabs = [];
    List<Widget> tabsView = [];

    int start_level = 0;
    int max_level = character_class.max_level;

    if (character_class.has_zero_level) {
      start_level = 1;
      max_level = character_class.max_level - 1;
    }
    
    for (int level = start_level; level < max_level; level++) {
      tabs.add(Tab(child: Text(level.toString() + "-й круг", style: TextStyle(fontSize: 16),),));
      tabsView.add(SpellListView(spells, character_class, level));
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return DefaultTabController(
              length: max_level,
              child: Scaffold(
                appBar: AppBar(
                    title: Text(character_class.name),
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
