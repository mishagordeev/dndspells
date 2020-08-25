import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlPart extends StatelessWidget {
  final String rawHtml;
  final TextStyle style;

  HtmlPart(this.rawHtml, this.style);

  @override
  Widget build(BuildContext context) {
    return Html(data: rawHtml, defaultTextStyle: style);
  }
}