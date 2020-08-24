import 'package:flutter/material.dart';

import '../spell.dart';
import 'separator.dart';
import 'description/spell_view_description.dart';
import 'spell_parameters.dart';
import 'spell_availability.dart';
import 'spell_other_names.dart';


class SpellView extends StatelessWidget {
  final Spell spell;
  SpellView(this.spell);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SpellOtherNames(spell.name["phantom"], spell.name["english"]),
        SpellParameters(spell.castTime, spell.duration, spell.distance, spell.components),
        Separator(),
        SpellViewDescription(spell.description),
        Separator(),
        SpellAvailability(spell.availableFor)
      ],
        padding: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 18.0),
    );
  }
}
