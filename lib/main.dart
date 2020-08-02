import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:getfromdatabase/forerunner.dart';
import 'package:getfromdatabase/robot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Garmin ESP32';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/l2.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ExpansionTile(
              title: Text("Sensors"),
              children: <Widget>[
                ListTile(
                  title: Text('Forerunner 235'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Forerunner()));
                  },
                )
              ],
            ),

            ExpansionTile(
              title: Text("Robots"),
              children: <Widget>[
                ListTile(
                  title: Text('Robot'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Robot()));
                  },
                ),
                ListTile(
                  title: Text('Robot 2'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                  },
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
