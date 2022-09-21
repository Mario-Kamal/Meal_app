import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class DisplayedMealsScreen extends StatefulWidget {
  final List<Meal> avaliableMeals;

   DisplayedMealsScreen( this.avaliableMeals) ;
  @override
  _DisplayedMealsScreenState createState() => _DisplayedMealsScreenState();
}

class _DisplayedMealsScreenState extends State<DisplayedMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayedMeals = widget.avaliableMeals.where((meal) {
      return meal.category.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void removeMeal (String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            categoryTitle,
            style: TextStyle(fontSize: 30),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black,
              Colors.deepPurple,
              Colors.black,
              Colors.black
            ])),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
