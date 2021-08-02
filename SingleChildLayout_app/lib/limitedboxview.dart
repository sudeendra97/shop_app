import 'package:flutter/material.dart';

class limitedboxView extends StatelessWidget {
  const limitedboxView({Key? key}) : super(key: key);

  Color randomColor(int i) {
    switch (i) {
      case 1:
        return Color(0xFF52006A);
      case 2:
        return Color(0xFF402218);

      case 3:
        return Color(0xFF053742);

      case 4:
        return Color(0xFF185ADB);
      case 5:
        return Color(0xFF5F939A);
      case 6:
        return Color(0xFF3EDBF0);
      case 7:
        return Color(0xFFB4846C);
      case 8:
        return Color(0xFFC84B31);
      case 9:
        return Color(0xFFBF1363);
      case 10:
        return Color(0xFF064420);

      default:
        return Color(0xFFFFF5DA);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            for (int i = 0; i <= 10; i++)
              LimitedBox(
                maxHeight: 200,
                child: Container(
                  color: randomColor(i),
                ),
              )
          ],
        ),
      ),
    );
  }
}
