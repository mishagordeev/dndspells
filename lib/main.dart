import 'package:flutter/material.dart';
import 'Spell.dart';
import 'Class.dart';
import 'SpellSearch.dart';
import 'ClassListView.dart';
import 'ExternalData.dart';

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

          List<Class> classes = ExternalData().convert(snapshot.data[0], "Class");
          List<Spell> spells = ExternalData().convert(snapshot.data[1], "Spell");
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
                          title: Text(
                            "Книга заклинаний",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                        ),
                        body: ClassListView(spells, classes)
                    ),
                  ),
                ) 
        });
  }
}
