import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categoryitem.dart';
import 'package:meals_app/dummydata.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (e) => CategoryItem(e.id, e.title, e.color),
              )
              .toList(),
        ),
      ),
    );
  }
}
