import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

   TabsScreen( this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> pages;
  int selectedPageIndex =0;
  @override
  void initState(){
    pages = [
      {
        'page':CategoriesScreen(),
        'title':"Category",
      },
      {
        'page':FavouritesScreen(widget.favouriteMeals),
        'title':"Favourite",
      }
    ];
  }
  void selectedPage(int value){
    setState(() {
      selectedPageIndex = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pages[selectedPageIndex]['title'],
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
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        onTap:selectedPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),

        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
