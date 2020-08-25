import 'package:dndspells/styles.dart';
import 'package:flutter/material.dart';
import 'package:dndspells/spell/spell.dart';
import 'spell_view.dart';
import 'spell_attributes/spell_attributes.dart';

void showSpellView(Spell spell, BuildContext context) {

  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Column(
                    children: <Widget>[
                      Text(spell.name["hobby"]),
                      Text("${spell.level}-й круг, ${spell.school}" + (spell.ritual ? "(ритуал)" : ""))
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start
                ),
                actions: spellAttributes(spell.concentration, spell.ritual),
                backgroundColor: Colors.red[900]
            ),
            body: SpellView(spell)
        );
      },
    ),
  );
}