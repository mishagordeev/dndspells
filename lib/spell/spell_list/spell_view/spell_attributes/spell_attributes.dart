import 'attribute.dart';
import 'package:flutter/material.dart';

List<Widget> spellAttributes(bool concentration, bool ritual) {
    List<Widget> attributes = [];
    if (ritual) {
      attributes.add(Attribute("Р"));
    }
    if (concentration) {
      attributes.add(Attribute("К"));
    }
    return attributes;
}