import 'package:flutter/material.dart';
import 'spell.dart';
import 'character_class.dart';
import 'spell_search.dart';
import 'class_list_view.dart';
import 'external_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          DefaultAssetBundle.of(context).loadString('assets/classes.json'),
          DefaultAssetBundle.of(context).loadString('assets/spells.json')
        ]),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (!snapshot.hasData) { 
            return Center(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red[900]))
                    );
          }

          List<CharacterClass> classes = convert(snapshot.data[0], "Class");
          List<Spell> spells = convert(snapshot.data[1], "Spell");
          return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: Colors.red[900],
                    hintColor: Colors.white70,
                    cursorColor: Colors.white,
                    textSelectionColor: Colors.red,
                    accentColor: Colors.red[900]
                  ),
                  home: Builder(
                    builder: (context) => Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          title: Row(
                            children: <Widget>[
                              Container(
                              ),

                              Container(
                                child: Text(
                                    "Заклинания",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                                ),
                                padding: EdgeInsets.only(left: 1.5),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.search,
                              ),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: SpellSearch(spells));
                              },
                            ),
                          ],
                          backgroundColor: Colors.red[900],
                        ),
                        body: ClassListView(spells, classes)
                    ),
                  ),
                );
        });
  }
}
