import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile (BuildContext context ,String title,IconData icon,Function tapHere){
    return ListTile(
      leading: Icon(icon,size: 40,color: Theme.of(context).primaryColor,),
      title: Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
      onTap: tapHere,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomLeft,
            child: Text("Meal App",style: Theme.of(context).textTheme.subtitle1,),
          ),
          const SizedBox(height: 30,),
          buildListTile(context, "Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          const SizedBox(height: 30,),
          buildListTile(context, "Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed('Filters');}),
        ],
      ),
    );
  }
}
