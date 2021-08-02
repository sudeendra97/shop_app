import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Boxer extends StatelessWidget {
  final image = [
    Image.asset(
      'assets/Boxer/Boxer1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Boxer/Boxer2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/Boxer/Boxer3.jpg',
      fit: BoxFit.cover,
    ),
  ];
  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Boxer'),
        ),
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
              child: Text(
                'The Boxer is a medium to large, short-haired breed of dog, developed in Germany. '
                'The coat is smooth and tight-fitting; colors are fawn, brindled, or white, with or without white markings.'
                ' Boxers are brachycephalic (they have broad, short skulls), have a square muzzle, mandibular prognathism (an underbite), very strong jaws, and a powerful bite ideal for hanging on to large prey. The Boxer was bred from the Old English Bulldog and the now extinct Bullenbeisser, which became extinct by crossbreeding rather than by a decadence of the breed. The Boxer is a member of the American Kennel Club (AKC) Working Group.',
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
