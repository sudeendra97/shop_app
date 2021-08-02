import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(GridViewclass());
}

class GridViewclass extends StatelessWidget {
  const GridViewclass({Key? key}) : super(key: key);
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

      case 11:
        return Color(0xFF52006A);
      case 12:
        return Color(0xFF402218);

      case 13:
        return Color(0xFF053742);

      case 14:
        return Color(0xFF185ADB);
      case 15:
        return Color(0xFF5F939A);
      case 16:
        return Color(0xFF3EDBF0);
      case 17:
        return Color(0xFFB4846C);
      case 18:
        return Color(0xFFC84B31);
      case 19:
        return Color(0xFFBF1363);
      case 20:
        return Color(0xFF064420);
      case 21:
        return Color(0xFF52006A);
      case 22:
        return Color(0xFF402218);

      case 23:
        return Color(0xFF053742);

      case 24:
        return Color(0xFF185ADB);
      case 25:
        return Color(0xFF5F939A);
      case 26:
        return Color(0xFF3EDBF0);
      case 27:
        return Color(0xFFB4846C);
      case 28:
        return Color(0xFFC84B31);
      case 29:
        return Color(0xFFBF1363);
      case 30:
        return Color(0xFF064420);

      default:
        return Color(0xFFFFF5DA);
    }
  }

  Image imagestore(int i) {
    switch (i) {
      case 1:
        return Image.asset('assets/2.jpg');
      case 2:
        return Image.asset('assets/3.jpg');
      case 3:
        return Image.asset('assets/4.jpg');
      case 4:
        return Image.asset('assets/5.jpg');
      case 5:
        return Image.asset('assets/6.jpg');
      case 6:
        return Image.asset('assets/7.jpg');
      case 7:
        return Image.asset('assets/8.jpg');
      case 8:
        return Image.asset('assets/9.jpg');
      case 9:
        return Image.asset('assets/10.jpg');
      case 10:
        return Image.asset('assets/11.jpg');
      case 11:
        return Image.asset('assets/12.jpg');
      case 12:
        return Image.asset('assets/13.jpg');
      case 13:
        return Image.asset('assets/14.jpg');
      case 14:
        return Image.asset('assets/15.jpg');
      case 15:
        return Image.asset('assets/18.jpg');
      case 16:
        return Image.asset('assets/15.jpg');

      default:
        return Image.asset('assets/1.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ColoredGridView'),
        ),
        body: GridView.count(
          crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
          crossAxisCount: 1,
          children: [
            ListView(
              padding: EdgeInsets.all(05),
              addAutomaticKeepAlives: true,
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 1; i <= 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: imagestore(i),
                      width: 530,
                      height: 500,
                    ),
                  ),
                // Container(
                //   color: randomColor(i),
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.all(10),
                // ),
              ],
            ),
            for (int i = 0; i <= 15; i++)
              FittedBox(
                child: imagestore(i),
                fit: BoxFit.contain,
              ),
          ],
        ),
      ),
    );
  }
}
