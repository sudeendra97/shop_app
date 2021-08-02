import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BombayCat extends StatefulWidget {
  @override
  State<BombayCat> createState() => _BombayCatState();
}

class _BombayCatState extends State<BombayCat> {
  final image = [
    Image.asset(
      'assets/Cats/AmericanShorthair/AmericanShorthair1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Cats/AmericanShorthair/AmericanShorthair2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Cats/AmericanShorthair/AmericanShorthair3.jpg',
      fit: BoxFit.cover,
    ),
  ];

  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

  bool _pinned = false;

  bool _snap = false;

  bool _floating = false;

  @override
  Widget build(BuildContext context) {
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
                  'American Shorthair',
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
          body: GridView.count(
            crossAxisCount: 1,
            children: [
              ListView(
                padding: EdgeInsets.only(top: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Align(alignment: Alignment.center),
                  for (int i = 0; i < image.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          child: image[i],
                          width: 485,
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                // alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.merriweather(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'The pug is a breed of dog with physically distinctive features of a wrinkly, short-muzzled face, and curled tail. '
                            'The breed has a fine, glossy coat that comes in a variety of colours, most often light brown (fawn) or black, '
                            'and a compact, square body with well-developed muscles.\n',
                      ),
                      TextSpan(
                        text:
                            'Pugs were brought from China to Europe in the sixteenth century and were popularized in Western Europe by the House of Orange of the Netherlands, '
                            'and the House of Stuart.[2] In the United Kingdom, in the nineteenth century, '
                            'Queen Victoria developed a passion for pugs which she passed on to other members of the Royal family.\n',
                      ),
                      TextSpan(
                        text:
                            'Pugs are known for being sociable and gentle companion dogs\n',
                      ),
                      // TextSpan(
                      //     text:
                      //         'Pugs remain popular into the twenty-first century, with some famous celebrity owners.')
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
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Life Span:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' 12-15 years\n'),
                      TextSpan(
                        text: 'Origin:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' China\n'),
                      TextSpan(
                        text: 'Temperment: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' Playful, Affectionate, Charming, Stubborn, Mischievous, Clever, Docile, Sociable, Loving, Attentive, Quiet, Calm\n',
                      ),
                      TextSpan(
                        text: 'Colors: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Black, Fawn, Apricot, Silver Fawn\n',
                      ),
                      TextSpan(
                        text: 'Height: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' Male: 30 – 36 cm (At the withers), Female: 25 – 30 cm (At the withers)',
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
