import 'package:flutter/material.dart';
import '../../styles.dart';

class SpellParameters extends StatelessWidget {
  final String castTime;
  final String duration;
  final String distance;
  final String components;

  SpellParameters(this.castTime, this.duration, this.distance, this.components);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(text: TextSpan(children: [
        TextSpan(text: "Время сотворения: ", style: boldTextStyle), TextSpan(text: "$castTime\n"),
        TextSpan(text: "Длительность: ", style: boldTextStyle), TextSpan(text: "$duration\n"),
        TextSpan(text: "Дистанция: ", style: boldTextStyle), TextSpan(text: "$distance\n"),
        TextSpan(text: "Компоненты: ", style: boldTextStyle), TextSpan(text: "$components"),
    ], style: defaultTextStyle)),
      padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
    );
  }
}