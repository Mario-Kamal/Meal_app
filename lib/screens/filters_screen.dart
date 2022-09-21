import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String,bool> selectedFilters;

  FiltersScreen(this.selectedFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onChanged: updateValue);
  }

  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;
  @override
  void initState() {
     glutenFree = widget.selectedFilters['gluten'];
     lactoseFree = widget.selectedFilters['lactose'];
     vegan = widget.selectedFilters['vegan'];
     vegetarian = widget.selectedFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(onPressed:(){
            final selectedFilters={
              'gluten':glutenFree,
              'lactose':lactoseFree,
              'vegan':vegan,
              'vegetarian':vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "GlutenFree",
                  "Only include GlutenFree meals",
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "LactoseFree",
                  "Only include LactoseFree meals",
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only include Vegan meals",
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
