import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fourth_app/cats/AmericanShorthair.dart';
import 'package:fourth_app/cats/BengalCat.dart';
import 'package:fourth_app/cats/BombayCat.dart';
import 'package:fourth_app/cats/BritishShothair.dart';
import 'package:fourth_app/cats/HimalayanCat.dart';
import 'package:fourth_app/cats/NorweignForestCat.dart';
import 'package:fourth_app/cats/persianCat.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class cats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CatExtends();
  }
}

class CatExtends extends StatelessWidget {
  const CatExtends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: [
        for (final location in locations)
          CatListItem(
            imageUrl: location.imageUrl,
            name: location.name,
            country: location.place,
            index: location.index,
          ),
      ],
    );
  }
}

class CatListItem extends StatelessWidget {
  CatListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.country,
    required this.index,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String country;
  final index;

  Widget indexRoute(index) {
    switch (index) {
      case 1:
        return AmericanShorthair();
      case 2:
        return BengalCat();
      case 3:
        return BombayCat();
      case 4:
        return BritishShorthair();
      case 5:
        return HimalayanCat();
      case 6:
        return NorweignForestCat();
      case 7:
        return persianCat();

      default:
        return BengalCat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => indexRoute(index)),
          );
        },
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildBackground(context),
                _buildTitleAndSubtitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
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

class CatBreeds {
  const CatBreeds({
    required this.name,
    required this.place,
    required this.imageUrl,
    required this.index,
  });

  final String name;
  final String place;
  final String imageUrl;
  final index;
}

const locations = [
  CatBreeds(
    name: 'AmericanShorthair',
    place: 'U.S.A',
    imageUrl: 'assets/AmericanShorthair.jpg',
    index: 1,
  ),
  CatBreeds(
    name: 'BengalCat',
    place: 'India',
    imageUrl: 'assets/BengalCat.jpg',
    index: 2,
  ),
  CatBreeds(
    name: 'BombayCat',
    place: 'India',
    imageUrl: 'assets/BombayCat.jpg',
    index: 3,
  ),
  CatBreeds(
    name: 'BritishShothair',
    place: 'Switzerland',
    imageUrl: 'assets/BritishShothair.jpg',
    index: 4,
  ),
  CatBreeds(
    name: 'HimalayanCat',
    place: 'Indonesia',
    imageUrl: 'assets/HimalayanCat.jpg',
    index: 5,
  ),
  CatBreeds(
    name: 'NorweignForestCat',
    place: 'india',
    imageUrl: 'assets/NorweignForestCat.jpg',
    index: 6,
  ),
  CatBreeds(
    name: 'persianCat',
    place: 'india',
    imageUrl: 'assets/persianCat.jpg',
    index: 7,
  ),
  CatBreeds(
    name: 'SiberainCat',
    place: 'india',
    imageUrl: 'assets/SiberainCat.jpg',
    index: 8,
  ),
];
