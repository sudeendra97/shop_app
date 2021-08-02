import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pomeranian extends StatefulWidget {
  @override
  State<Pomeranian> createState() => _PomeranianState();
}

class _PomeranianState extends State<Pomeranian> {
  final image = [
    Image.asset(
      'assets/Pomeranian/Pomeranian1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Pomeranian/Pomeranian2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Pomeranian/Pomeranian3.jpg',
      fit: BoxFit.cover,
    ),
  ];

  final Color darkBlue = Color(0xFFe8f4f7);

  bool _pinned = false;

  bool _snap = false;

  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 20.0,
                title: Text(
                  'POMERANIAN',
                  style: GoogleFonts.merriweather(
                      textStyle: TextStyle(fontSize: 20)),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      final snackbar = SnackBar(
                        content: Text('Added to favorites'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Container(
                width: 400,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    children: <Widget>[
                      for (int i = 0; i < image.length; i++)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: image[i],
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                // alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.merriweather(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'The Pomeranian (often known as a Pom) is a breed of dog of the Spitz type that is named for the Pomerania region in north-west Poland and north-east Germany in Central Europe. Classed as a toy dog breed because of its small size, the Pomeranian is descended from larger Spitz-type dogs, specifically the German Spitz\n',
                      ),
                      TextSpan(
                        text:
                            'The breed has been made popular by a number of royal owners since the 18th century. Queen Victoria owned a particularly small Pomeranian and consequently, the smaller variety became universally popular. During Queen Victoria'
                            's lifetime alone, the size of the breed decreased by half. Overall, the Pomeranian is a sturdy, healthy dog\n',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                // alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.merriweather(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Life Span:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' 12-16 years\n'),
                      TextSpan(
                        text: 'Weight:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' 1.4 to 3.2kg \n'),
                      TextSpan(
                        text: 'Temperment: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' Playful, Intelligent, Friendly, Extroverted, Sociable, Active\n',
                      ),
                      TextSpan(
                        text: 'Colors: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'White, Black, Blue, Red, Cream, Grey-shaded, Tan, Orange, Brown\n',
                      ),
                      TextSpan(
                        text: 'Height: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' Male: 18 – 30 cm (At the withers), Female: 25 – 30 cm (At the withers)',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
