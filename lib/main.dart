import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'App Idea Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppIdea appIdea = generateAppIdea(AppIdea());

  void _refreshAppIdea() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      appIdea = generateAppIdea(appIdea);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              appIdea.genre,
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            Text(
              appIdea.separator,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              appIdea.category,
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: FlatButton(
                      onPressed: _refreshAppIdea,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Generate new idea",
                          style: TextStyle(fontSize: 18),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

class AppIdea {
  String genre;
  String separator;
  String category;

  AppIdea({this.genre = "", this.separator = "", this.category = ""});
}

AppIdea generateAppIdea(AppIdea prev) {
  String genre = "";
  while (genre == prev.genre || genre == "") {
    genre = genres[Random().nextInt(genres.length)];
  }

  List<String> categoryList = List.from(categoryButIts, growable: true);
  categoryList.insertAll(0, categoryFor);
  String category = "";
  while (category == prev.category || category == "") {
    category = categoryList[Random().nextInt(categoryList.length)];
  }

  String separator = "";
  if (categoryButIts.contains(category)) {
    separator = "but it's";
  } else if (categoryFor.contains(category)) {
    separator = "for";
  }
  return AppIdea(genre: genre, separator: separator, category: category);
}

const List<String> genres = [
  "A social media network",
  "A messaging app",
  "Youtube",
  "A video game",
  "A battle royale",
  "A music app",
  "An app launcher",
  "Tinder",
  "ASMR",
  "A trivia app",
  "Venmo",
  "A workout app",
  "An e-learning app",
  "Tinder",
  "Live streaming",
  "A virtual reality app",
  "AI generated stories",
  "A card game",
  "Horoscopes",
];

const List<String> categoryFor = [
  "dogs",
  "chefs",
  "movie-goers",
  "tall people",
  "short people",
  "people learning how to cook",
  "marathon runners",
  "bankers",
  "sneakerheads",
  "recipes",
  "gun owners",
  "mechanical keyboard nerds",
  "woodworkers",
  "robots",
  "babies",
  "RC plane pilots",
  "writers",
  "programmers",
  "designers",
  "deaf people",
  "blind people",
  "gun enthusiasts",
  "gamers",
  "musicians",
  "historical reenactors",
  "artists",
  "billionaires",
  "meeting new people",
  "connecting with friends",
  "finding penpals",
  "flutter developers",
  "vegans",
  "finding new podcasts"
];

const List<String> categoryButIts = ["a battle royale", "in VR"];
