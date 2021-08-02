import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sixth_app/nestedcontainer.dart';
import 'package:sixth_app/nestedcontainer1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('column'),
            backgroundColor: Colors.green,
          ),
          body: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Hello',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    color: Colors.black,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(top: 8, left: 05),
                  ),
                  Container(
                    child: Text('world',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    color: Colors.blue,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(top: 8),
                  ),
                  Container(
                    child: Text('world',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    color: Colors.red,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(top: 8),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: nestedcontainer(),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 8, left: 5),
                    color: Colors.yellow,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
