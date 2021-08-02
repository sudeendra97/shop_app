import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppState(),
    );
  }
}

class MyAppState extends StatefulWidget {
  MyAppState({Key? key}) : super(key: key);

  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  int index = 0;
  Widget _stackedContainers() {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: <Widget>[
          Container(
            child: Center(
              child: Image.asset('assets/1.jpg'),
            ),
          ),
          Container(
            child: Center(
              child: Image.asset('assets/2.jpg'),
            ),
          ),
          Container(
            child: Center(
              child: Image.asset('assets/3.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navigationButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            color: Colors.red[200],
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
            child: Text(
              'First Image',
              style: TextStyle(color: Colors.blue[200], fontSize: 20),
            ),
          ),
          FlatButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                index = 1;
              });
            },
            child: Text(
              '2nd image',
              style: TextStyle(color: Colors.yellow[500], fontSize: 20),
            ),
          ),
          FlatButton(
            color: Colors.brown[200],
            onPressed: () {
              setState(() {
                index = 2;
              });
            },
            child: Text(
              '3rd image',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indexed Stack'),
      ),
      body: Padding(
        child: Column(
          children: <Widget>[
            _stackedContainers(),
            _navigationButton(),
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
