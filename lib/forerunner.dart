import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Forerunner extends StatefulWidget{
  @override
  _ForerunnerState createState() => _ForerunnerState();
}

class _ForerunnerState extends State<Forerunner>
    with SingleTickerProviderStateMixin {

  Widget build(BuildContext context){
    var databaseReference = FirebaseDatabase().reference().child('test');

    return Scaffold(
      appBar: AppBar(
        title: Text('Forerunner 235'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: StreamBuilder(
                stream: databaseReference.onValue,
                builder: (context, snap){
                  if (snap.hasData){

                    Map data = snap.data.snapshot.value;

                    var data_keys = data.keys.toList();
                    var data_values = data.values.toList();

                    return ListView.builder(
                        itemCount: data_keys.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: ListTile(
                              title: Text(data_keys[index]),
                              trailing: Text(data_values[index]),
                            ),
                          );
                        },
                    );
                  }
                  else
                    return Text("Loading");
                }
              )
            )
          ],
        ),
      )
    );
  }
}