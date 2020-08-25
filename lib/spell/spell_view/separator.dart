import 'package:flutter/material.dart';

class Separator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE40712).withOpacity(0.6),
      height: 1,
      padding: EdgeInsets.fromLTRB(50, 0, 3, 0),
      margin: EdgeInsets.fromLTRB(2, 7, 2, 3),
    );
  }
}