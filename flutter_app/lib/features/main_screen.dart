import 'package:flutter/material.dart';
import 'package:flutter_app/features/groups/presentation/views/groups_page.dart';
import 'package:flutter_app/features/hal/presentation/views/hal_page.dart';
import 'package:flutter_app/features/home/presentation/views/home_page.dart';
import 'package:flutter_app/features/resources/presentation/views/resources_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<Widget> _screens = [
    HomePage(),
    ResourcesScreen(),
    GroupsPage(),
    HalPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(33, 4, 0, 255),
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
        ),
        
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          selectedItemColor: Color(0x400300FF),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: Text('Home',style: Theme.of(context).textTheme.labelLarge,),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.book),
              title:Text('Resources',style: Theme.of(context).textTheme.labelLarge,),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.group),
              title: Text('Groups',style: Theme.of(context).textTheme.labelLarge),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.lightbulb),
              title: Text('HAL',style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
      body: Center(
        child: _screens[_currentIndex],
      ),
    );
  }
}
