import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double l;
  final double t;
  final double r;
  final double b;

  Separator(this.l, this.t, this.r, this.b);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE40712).withOpacity(0.6),
      height: 1,
      margin: EdgeInsets.fromLTRB(l, t, r, b),
    );
  }
}