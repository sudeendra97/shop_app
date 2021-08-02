import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fourth_app/dogs/Boxer.dart';
import 'package:fourth_app/dogs/BullDog.dart';
import 'package:fourth_app/dogs/DoberMan.dart';
import 'package:fourth_app/dogs/GermanShephard.dart';
import 'package:fourth_app/dogs/GoldenRetriever.dart';
import 'package:fourth_app/dogs/Pug.dart';
import 'dogs/Pomeranian.dart';
import 'dogs/DoberMan.dart';
import './dogs/GermanShephard.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class dog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          for (var breeds in Dogs)
            DogListItem(
              imageUrl: breeds.imageUrl,
              name: breeds.name,
              country: breeds.place,
              index: breeds.index,
            ),
        ],
      ),
    );
  }
}

class DogListItem extends StatelessWidget {
  DogListItem({
    required this.imageUrl,
    required this.name,
    required this.country,
    required this.index,
  });

  final String imageUrl;
  final String name;
  final String country;
  final index;

  Widget indexRoute(index) {
    switch (index) {
      case 1:
        return Pug();
      case 2:
        return Pomeranian();
      case 3:
        return DoberMan();
      case 4:
        return BullDog();
      case 5:
        return Boxer();
      case 6:
        return GermanShephard();
      case 7:
        return GoldenRetriever();

      default:
        return Pug();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextButton(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                _buildBackground(),
                _buildTitleAndSubtitle(),
              ],
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => indexRoute(index)),
          );
        },
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: 450,
      height: 250,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Breeds {
  Breeds({
    required this.name,
    required this.place,
    required this.imageUrl,
    required this.index,
  });

  String name;
  String place;
  String imageUrl;
  var index;
}

var Dogs = [
  Breeds(
    name: 'Pug',
    place: 'U.S.A',
    imageUrl: 'assets/pug.jpg',
    index: 1,
  ),
  Breeds(
    name: 'Pomeranian',
    place: 'China',
    imageUrl: 'assets/pomeranian.jpg',
    index: 2,
  ),
  Breeds(
    name: 'DoberMan',
    place: 'Peru',
    imageUrl: 'assets/Doberman.jpg',
    index: 3,
  ),
  Breeds(
    name: 'BullDog',
    place: 'Switzerland',
    imageUrl: 'assets/bulldog.jpg',
    index: 4,
  ),
  Breeds(
    name: 'Boxer',
    place: 'Indonesia',
    imageUrl: 'assets/boxer1.jpg',
    index: 5,
  ),
  Breeds(
    name: 'GermanShephard',
    place: 'india',
    imageUrl: 'assets/germanshephard.jpg',
    index: 6,
  ),
  Breeds(
    name: 'GoldenRetriever',
    place: 'india',
    imageUrl: 'assets/goldenretriver.jpg',
    index: 7,
  ),
];
