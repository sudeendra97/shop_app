import 'package:flutter/material.dart';
import 'package:layout_app/NextPage.dart';
import 'package:layout_app/OffStageClass.dart';
import 'package:layout_app/limitedboxview.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mystate(),
    );
  }
}

class Mystate extends StatefulWidget {
  Mystate({Key? key}) : super(key: key);

  @override
  _MystateState createState() => _MystateState();
}

class _MystateState extends State<Mystate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout designs'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.red[100],
              width: 200,
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'First Container',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              transform: Matrix4.rotationZ(0.05),
            ),
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 200,
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue[100],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Aspect Ratio'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.green[100],
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100, maxWidth: 150),
                child: RaisedButton(
                  color: Colors.pink[100],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Constrained Box',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextPage()),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                child: ElevatedButton(
                  child: Text('list page'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => limitedboxView()));
                  },
                ),
              ),
            ),
            Container(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OffStageClass()));
                  },
                  child: Text('OffStagepreview'),
                ),
              ),
            ),
            Container(
              child: Flexible(
                child: Image.asset('assets/image.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
