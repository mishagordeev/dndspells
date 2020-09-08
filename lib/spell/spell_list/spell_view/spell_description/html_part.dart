import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dndspells/styles.dart';

class HtmlPart extends StatelessWidget {
  final htmlData;

  HtmlPart(this.htmlData);

  @override
  Widget build(BuildContext context) {
    return Html(data: htmlData["html_string"], defaultTextStyle: defaultTextStyle,);
  }
}