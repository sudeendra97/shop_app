import 'package:flutter/material.dart';
import 'package:icon_app/AppIconsIcon.dart';
import 'package:icon_app/Dogs.dart';
import 'package:icon_app/MessagePage.dart';
import 'package:icon_app/birds.dart';
import './AppIconsIcon.dart';
import 'cats.dart';

void main(List<String> args) {
  runApp(MyAppClass());
}

class MyAppClass extends StatelessWidget {
  const MyAppClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pet Shop',
        theme: ThemeData(backgroundColor: Color.fromARGB(255, 18, 32, 47)),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => messagePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('profile'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Pet Store'),
        titleSpacing: 10,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome, Here we sell different kinds of pets like Dogs, Cats, Birds',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.blue[100],
                leading: Icon(Icons.pets),
                horizontalTitleGap: 60,
                title: Text(
                  'Dogs',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dog()),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.blue[200],
                leading: Icon(
                  AppIconsIcon.cat,
                ),
                minLeadingWidth: 80,
                title: Text(
                  'cats',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cats()),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.blue[300],
              leading: Icon(AppIconsIcon.bird),
              minLeadingWidth: 80,
              title: Text(
                'Birds',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => birds()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
