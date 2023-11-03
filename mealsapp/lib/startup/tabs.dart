import 'package:flutter/material.dart';
import 'package:mealsapp/features/meals/presentation/favorites.dart';

import '../features/meals/presentation/categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  void selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget setPage(){
    switch(_currentIndex){
      case 0: return const Categories();
      case 1: return const Favorites();
      default: return const Placeholder();
    }
  }

  Widget setTitle(){
    switch(_currentIndex){
      case 0: return const Text('Categories');
      case 1: return const Text('Favorites');
      default: return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: setTitle()),
      body: setPage(),
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: _currentIndex, onTap: selectPage,items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],),
    );
  }
}
