import 'package:flutter/material.dart';
import 'package:sixth_app/nestedcontainer1.dart';

class nestedcontainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: nestedcontainer1(),
      padding: EdgeInsets.all(20),
      color: Colors.blue,
    );
  }
}
