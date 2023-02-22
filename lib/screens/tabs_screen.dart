import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> _pages;
  int _selectPageIndex =0;
  @override
  void initState() {
    _pages = [
      {'page':CategoriesScreen(),'title':'Categories'},
      {'page':FavoritesScreen(widget.favoriteMeals),'title':'Your Favourite'},
    ];
    super.initState();
  }
  void _selectPage(int index){
    setState(() {
      _selectPageIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor,icon: Icon(Icons.category), label:'Categories',),
          BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor,icon: Icon(Icons.star), label:'Favourites',),
        ],
      ),
    );
  }
}
