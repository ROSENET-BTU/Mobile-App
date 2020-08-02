import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Robot extends StatefulWidget{
  @override
  _RobotState createState() => _RobotState();
}

class _RobotState extends State<Robot>
    with SingleTickerProviderStateMixin {

  final String url = "http://rosenet.herokuapp.com/robot/getall";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
     var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
     print(response.body);


     setState(() {
       var datatojson = json.decode(response.body);
       print(datatojson[0]['sensor']);
     });
     return 'success';
  }

  Widget build(BuildContext context){
    var databaseReference = FirebaseDatabase().reference().child('test');

    return Scaffold(
        appBar: AppBar(
          title: Text('Robot'),
        ),
        body: Center(

        )
    );
  }
}