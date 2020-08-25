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
        descriptionWidgets.add(HtmlPart(spellDescriptionPart["html_string"], defaultTextStyle));
      }
      if (type == "table") {
        descriptionWidgets.add(TablePart(spellDescriptionPart, defaultTextStyle));
      }
    }
    return Container(child: Column(children: descriptionWidgets));
  }
}