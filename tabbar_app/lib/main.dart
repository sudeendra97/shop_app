import 'package:flutter/material.dart';
import 'package:fourth_app/Dogs.dart';
import 'package:fourth_app/birds.dart';
import 'package:fourth_app/cats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color darkBlue = Color(0xFFe8f4f7);
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Pet Shop',
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: darkBlue,
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF053742),
                  ),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorites'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                )
              ],
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xFF1E212D),
                  title: Text('Pet Shop'),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        text: 'Dogs',
                      ),
                      Tab(
                        text: 'Cats',
                      ),
                      Tab(
                        text: 'Birds',
                      )
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: dog(),
                ),
                Center(
                  child: cats(),
                ),
                Center(
                  child: birds(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
