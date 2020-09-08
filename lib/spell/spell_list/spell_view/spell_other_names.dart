import 'package:flutter/material.dart';
import '../../../styles.dart';

class SpellOtherNames extends StatelessWidget {
  final String phantomName;
  final String englishName;

  SpellOtherNames(this.phantomName, this.englishName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: "$phantomName, $englishName", style: italicTextStyle)
        ], style: defaultTextStyle),
      ),
      padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
    );
  }
}