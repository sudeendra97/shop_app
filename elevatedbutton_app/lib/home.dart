import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevated Button'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: Text('disabled'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
              onPressed: () {},
              child: Text('enabled'),
            ),
          ],
        ),
      ),
    );
  }
}
