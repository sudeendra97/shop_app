import 'package:flutter/material.dart';

class OffStageClass extends StatelessWidget {
  const OffStageClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OffStageState(),
    );
  }
}

class OffStageState extends StatefulWidget {
  OffStageState({Key? key}) : super(key: key);

  @override
  _OffStageStateState createState() => _OffStageStateState();
}

class _OffStageStateState extends State<OffStageState> {
  @override
  bool _offstage = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //   height: 200,
          // ),
          Flexible(
            child: Offstage(
              offstage: _offstage,
              child: Image.asset('assets/man.jpg'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _offstage = !_offstage;
                });
              },
              child: Text('Toggle off Stage value ${_offstage}'),
            ),
          ),
        ],
      ),
    );
  }
}
