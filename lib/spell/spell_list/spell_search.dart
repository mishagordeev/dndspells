import 'package:flutter/material.dart';
import '../spell.dart';
import 'spell_list.dart';

class SpellSearch extends SearchDelegate {
  List<Spell> spells;
  List<Spell> searchSuggestions;

  SpellSearch(this.spells);

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query != '') {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 18)),
        textTheme: theme.textTheme.copyWith(
            title: theme.textTheme.title
                .copyWith(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18)));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  String get searchFieldLabel => 'Поиск';

  @override
  Widget buildSuggestions(BuildContext context) {
    searchSuggestions = [];
    for (int i = 0; i < spells.length; i++) {
      if (spells[i].name["hobby"].toLowerCase().contains(query.toLowerCase()) ||
          spells[i].name["phantom"].toLowerCase().contains(query.toLowerCase()) ||
          spells[i].name["english"].toLowerCase().contains(query.toLowerCase())) {
        searchSuggestions.add(spells[i]);
      }
    }
    return SpellList(searchSuggestions);
  }
}