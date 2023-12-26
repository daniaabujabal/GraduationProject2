import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'Categories_Page.dart';
import 'Search_Page.dart';
import 'Setting_Page.dart';
class  MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CategoriesPage(),
    //SearchPage(searchQuery: ""),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),        bottomNavigationBar: BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: Color(0xFF71CDD7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Home Button
            IconButton(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.white : Colors.white60),
              onPressed: () => _onItemTapped(0),
            ),
            // Categories Button
            IconButton(
              icon: Icon(Icons.apps, color: _selectedIndex == 1 ? Colors.white : Colors.white60),
              onPressed: () => _onItemTapped(1),
            ),
            // Settings Button
            IconButton(
              icon: Icon(Icons.settings, color: _selectedIndex == 2 ? Colors.white : Colors.white60),
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    ),
    );
  }
}