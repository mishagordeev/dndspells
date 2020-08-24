import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'spell.dart';
import 'styles.dart';
import 'table_view.dart';
class SpellView extends StatelessWidget {
  final Spell spell;

  SpellView(this.spell);

  @override
  Widget build(BuildContext context) {

    final Container separator = Container(
      color: Color(0xffE40712).withOpacity(0.6),
      height: 1,
      padding: EdgeInsets.fromLTRB(50, 0, 3, 0),
      margin: EdgeInsets.fromLTRB(2, 7, 2, 3),
    );

    String available_for = "";
    for (var i = 0; i < spell.availableFor.length; i++) {
      available_for += spell.availableFor[i];
      if (i != spell.availableFor.length - 1) available_for += ", ";
    }
    List<Widget> descriptionWidget = [];

    List description = spell.description;
    for (var i = 0; i < description.length; i++) {
      if (description[i]["type"] == "html") {
        descriptionWidget.add(
          Html(data: description[0]["html_string"], defaultTextStyle: TextStyle(fontSize: 14,
              fontFamily: 'Serif', height: 1.2, color: Colors.black/*backgroundColor: Colors.green */),),
        );
      }
      if (description[i]["type"] == "table") {
        descriptionWidget.add(TableView(description[i], defaultTextStyle));
      }
    }
    return ListView(
      children: <Widget>[
        Container(child: RichText(text: TextSpan(children: [
          TextSpan(text: spell.name["phantom"] + ", " + spell.name["english"] + "\n", style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic)),
          TextSpan(text: "Время сотворения: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: spell.castTime + "\n", style: TextStyle(color: Colors.black)),
          TextSpan(text: "Длительность: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: spell.duration + "\n", style: TextStyle(color: Colors.black)),
          TextSpan(text: "Дистанция: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: spell.distance + "\n", style: TextStyle(color: Colors.black)),
          TextSpan(text: "Компоненты: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(text: spell.components, style: TextStyle(color: Colors.black)),
        ],
            style: defaultTextStyle)),
          padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
        ),
        separator,
        Container(
          child: Column(
            children: descriptionWidget,
          )
        ),
        separator,
        Container(
          child: Text(available_for, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black,
              fontFamily: 'Serif', height: 1.2)),
          padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
        )
      ],
        padding: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 18.0),
    );
  }
}
