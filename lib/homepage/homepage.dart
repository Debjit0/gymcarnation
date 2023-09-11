import 'package:flutter/material.dart';
import 'package:gymcarnation/homepage/page1.dart';
import 'package:gymcarnation/homepage/page2.dart';
import 'package:gymcarnation/homepage/page3.dart';
import 'package:gymcarnation/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buttom Navigation Bar',
      theme: getAppTheme(context, false),
      home: Scaffold(
        backgroundColor: const Color(0xff1C1C1E),
        body: [
          Page1(),
          Page2(),
          Page3(),
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xff1C1C1E),
          indicatorColor: Theme.of(context).primaryColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.list_outlined,
                color: Colors.white,
              ),
              label: 'More',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              icon: Icon(Icons.person_outlined, color: Colors.white),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
