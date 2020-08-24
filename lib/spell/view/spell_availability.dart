import 'package:flutter/material.dart';
import '../../styles.dart';


class SpellAvailability extends StatelessWidget {
  final List availableFor;

  SpellAvailability(this.availableFor);

  @override
  Widget build(BuildContext context) {

    var availableForString = availableFor.join(", ");

    return Container(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: availableForString, style: boldTextStyle)
        ], style: defaultTextStyle),
      ),
      padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
    );
  }
}