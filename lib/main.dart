import 'package:flutter/material.dart';
import 'Spell.dart';
import 'SpellSearch.dart';
import 'Json.dart';
import 'Class.dart';
import 'ClassList.dart';
import 'ClassListView.dart';
import 'SpellList.dart';
import 'ExternalData.dart';
import 'AboutView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          DefaultAssetBundle.of(context).loadString('assets/classes.json'),
          DefaultAssetBundle.of(context)
              .loadString('assets/path_spells_eng.json')
        ]).then(
          (response) =>
              new ExternalData(classes: response[0], spells: response[1]),
        ),
        builder: (context, AsyncSnapshot<ExternalData> snapshot) {
          var references = Json().parse(snapshot?.data?.spells?.toString());
          var referencesClasses =
              Json().parse(snapshot?.data?.classes?.toString());
          List<Spell> spells = SpellList().get(references);
          List<Class> classes = ClassList().get(referencesClasses);
          return spells.isNotEmpty && classes.isNotEmpty
              ? new MaterialApp(
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
                        body: ClassListView(spells, classes)),
                  ),
                )
              : new MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: Colors.red[900],
                    hintColor: Colors.white70,
                    cursorColor: Colors.white,
                    textSelectionColor: Colors.red,
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
                        body: Center(
                            child: new CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.red[900]),
                        ))),
                  ),
                );
        });
  }

  _showAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text("About"),
              ),
              body: AboutView());
        },
      ),
    );
  }
}
