import 'package:flutter/material.dart';
import 'package:meals_app/dummydata.dart';
import 'package:meals_app/screens/categoriesscreen.dart';
import 'package:meals_app/screens/categorymealsscreen.dart';
import 'package:meals_app/screens/filtersscreen.dart';
import 'package:meals_app/screens/mealdetailsscreen.dart';
import 'package:meals_app/screens/tabsscreen.dart';

import 'Models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilter(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where((meal) {
          if (_filters['gluten'] == true && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] == true && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] == true && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] == true && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  body1: const TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  body2: const TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  title: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                  ),
                )),
        // home:
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreen(_favoriteMeal),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailsScreen.routeName: (ctx) =>
              MealDetailsScreen(_toggleFavorite, _isMealFavorite),
          FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilter),
        },
        //this ongenerate route is used when the requested route is not generated
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        //this route is used when an error is generated
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
