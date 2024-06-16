import 'package:flutter/material.dart';
import 'package:on_campus/Main%20Screens/addpost.dart';
import 'package:on_campus/Main%20Screens/categories.dart';
import 'package:on_campus/Main%20Screens/profile.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../Main Screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedItemPosition = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Addpost(),
    const Categories(),
    const Profile(),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: _pages[_selectedItemPosition],
        bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Colors.white70 ,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(20),
    )),
    padding: const EdgeInsets.all(8),
    snakeViewColor: const Color.fromRGBO(87, 98, 213, 100),
    selectedItemColor: Colors.white,
    unselectedItemColor: const Color.fromRGBO(76, 76, 71, 100),
    showUnselectedLabels: true,
    showSelectedLabels: true,
    currentIndex: _selectedItemPosition,
    onTap: (index) => setState(() => _selectedItemPosition = index),
    items: const [
    BottomNavigationBarItem(
        icon: Icon(
            Icons.home,
        ),
        label: 'Home'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    BottomNavigationBarItem(
    icon: Icon(Icons.category), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
    )
    );
  }
}
