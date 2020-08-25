import 'package:flutter/material.dart';
import '../../../../styles.dart';

class Attribute extends StatelessWidget {
  final String attribute;

  Attribute(this.attribute);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(attribute, style: spellViewAppBarAttribute),
      padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
    );
  }
}