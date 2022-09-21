import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_detail_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setFilters(Map<String , bool> filterData){
    setState(() {
      filters=filterData;
      avaliableMeals=DUMMY_MEALS.where((meal) {
        if(filters['gluten']==true&&!meal.isGlutenFree){
          return false;
        };
        if(filters['lactose']==true&&!meal.isLactoseFree){
          return false;
        };
        if(filters['vegan']==true&&!meal.isVegan){
          return false;
        };
        if(filters['vegetarian']==true&&!meal.isVegetarian){
          return false;
        };
        return true;
      }).toList();
    });
  }
  List<Meal> avaliableMeals=DUMMY_MEALS;
  List<Meal> favouriteMeals=[];
  void toggleFavorite(String mealId){
    final existingIndex = favouriteMeals.indexWhere((meal) => meal.id==mealId);
    if (existingIndex>=0){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool isMealFavorite(String id){
    return favouriteMeals.any((meal) => meal.id==id);
  }
  Map<String,bool> filters ={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.greenAccent,
          canvasColor: Color.fromRGBO(220, 200, 150, 0),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.greenAccent),
              bodyText2: TextStyle(color: Colors.deepPurple),
              subtitle1: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      routes: {
        '/':(context)=>TabsScreen(favouriteMeals),
        'Category':(context)=>DisplayedMealsScreen(avaliableMeals),
        'Details':(context)=>CategoryDetailScreen(toggleFavorite,isMealFavorite),
        'Filters':(context)=>FiltersScreen(filters,setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Meal App",
          style: TextStyle(fontSize: 30),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.black,
            Colors.grey,
            Colors.black,
            Colors.black
          ])),
        ),
      ),
      body: CategoriesScreen(),
    );
  }
}
