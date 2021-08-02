import 'package:flutter/material.dart';
import 'package:sixth_app/nestedcontainer2.dart';

class nestedcontainer1 extends StatelessWidget {
  const nestedcontainer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: nestedcontainer2(),
      padding: EdgeInsets.all(100),
      color: Colors.red,
    );
  }
}
