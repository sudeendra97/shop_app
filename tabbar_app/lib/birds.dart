import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class birds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExampleParallax();
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
            ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.country,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextButton(
        onPressed: () {},
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
      child: Image.asset(
        imageUrl,
        key: _backgroundImageKey,
        fit: BoxFit.fill,
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

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'AtlanticCanary',
    place: 'U.S.A',
    imageUrl: 'assets/AtlanticCanary.jpg',
  ),
  Location(
    name: 'Budgerigar',
    place: 'India',
    imageUrl: 'assets/Budgerigar.jpg',
  ),
  Location(
    name: 'Cockatoos',
    place: 'India',
    imageUrl: 'assets/Cockatoos.jpg',
  ),
  Location(
    name: 'DomesticCanary',
    place: 'Switzerland',
    imageUrl: 'assets/DomesticCanary.jpg',
  ),
  Location(
    name: 'finches',
    place: 'Indonesia',
    imageUrl: 'assets/finches.jpg',
  ),
  Location(
    name: 'GreyParrot',
    place: 'india',
    imageUrl: 'assets/GreyParrot.jpg',
  ),
  Location(
    name: 'Lovebirds',
    place: 'india',
    imageUrl: 'assets/Lovebirds.jpg',
  ),
  Location(
    name: 'Owls',
    place: 'india',
    imageUrl: 'assets/Owls.png',
  ),
];
