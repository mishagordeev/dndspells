import 'package:flutter/material.dart';

import 'html_part.dart';
import 'table_part.dart';
import '../../../../styles.dart';

class SpellDescription extends StatelessWidget {
  final List spellDescription;

  SpellDescription(this.spellDescription);

  @override
  Widget build(BuildContext context) {

    List<Widget> descriptionWidgets = [];

    for (var i = 0; i < spellDescription.length; i++) {
      var spellDescriptionPart = spellDescription[i];
      String type = spellDescriptionPart["type"];

      if (type == "html") {
        descriptionWidgets.add(Container(child: HtmlPart(spellDescriptionPart)));
      }
      if (type == "table") {
        descriptionWidgets.add(Container(child: TablePart(spellDescriptionPart), padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0), alignment: Alignment.centerLeft));
      }
    }
    return Container(child: Column(children: descriptionWidgets));
  }
}