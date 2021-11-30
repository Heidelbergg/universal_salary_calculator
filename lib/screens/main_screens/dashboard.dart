import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:universal_salary_calculator/screens/main_screens/history_screen.dart';
import 'package:universal_salary_calculator/screens/main_screens/job_screen.dart';
import 'package:universal_salary_calculator/screens/main_screens/settings_screen.dart';
import 'home_screen.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Dashboard> {

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomeScreen(),
            JobScreen(),
            HistoryScreen(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 900), curve: Curves.easeOut);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: const Text('Home'),
              icon: const Icon(Icons.home)
          ),
          BottomNavyBarItem(
              title: const Text('Jobs'),
              icon: const Icon(Icons.apps)
          ),
          BottomNavyBarItem(
              title: const Text('History'),
              icon: const Icon(Icons.history)
          ),
          BottomNavyBarItem(
              title: const Text('Settings'),
              icon: const Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}
