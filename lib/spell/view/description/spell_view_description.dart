import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'table_view.dart';
import '../../../styles.dart';

class SpellViewDescription extends StatelessWidget {
  final List spellDescription;

  SpellViewDescription(this.spellDescription);

  @override
  Widget build(BuildContext context) {

    List<Widget> descriptionWidgets = [];

    for (var i = 0; i < spellDescription.length; i++) {
      String type = spellDescription[i]["type"];
      if (type == "html") {
        descriptionWidgets.add(Html(data: spellDescription[i]["html_string"], defaultTextStyle: defaultTextStyle));
      }
      if (type == "table") {
        descriptionWidgets.add(TableView(spellDescription[i], defaultTextStyle));
      }
    }

    return Container(child: Column(children: descriptionWidgets));
  }
}