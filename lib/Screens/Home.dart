import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/Screens/DashBoard.dart';
import 'package:cost_care/utils/Consts.dart';
import 'Notifications.dart';
import 'Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _cIndex = 0;

  PageController _pageController;

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

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _cIndex,
          showElevation: true,
          backgroundColor: kwhite,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              activeColor: kdarkBlue,
              inactiveColor: kgreyDark,
              title: Text(
                "Home",
                style: TextStyle(fontFamily: "nunito"),
              ),
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text(
                "Notifications",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: kgreyDark,
              activeColor: kdarkBlue,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: kgreyDark,
              activeColor: kdarkBlue,
            )
          ],
          onItemSelected: (index) {
            _incrementTab(index);
          }),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _cIndex = index);
          },
          children: <Widget>[
            Dashboard(),
            Notifications(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
