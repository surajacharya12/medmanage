import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medmanage3/screen/Dashbord.dart';
import 'package:medmanage3/screen/Massagetaball.dart';
import 'package:medmanage3/screen/Profilescreen.dart';
import 'package:medmanage3/screen/shedulescreen.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<IconData> icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.clipboardCheck,
    FontAwesomeIcons.user,
  ];

  int page = 0;

  // Example initial values for the profile
  String username = 'YourUsernameHere';
  String userEmail = 'userProfilescreen@gmail.com';

  List<Widget> pages = [
    Dashbord(),
    Massagetaball(),
    Shedulescreen(),
    Profilescreen(
      initialUsername: 'YourUsernameHere',
      initialUserEmail: 'userProfilescreen@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[page],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 20,
        activeIndex: page,
        height: 80,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        activeColor: const Color.fromARGB(255, 76, 5, 97),
        inactiveColor: const Color.fromARGB(255, 55, 10, 179),
        onTap: (int tappedIndex) {
          setState(() {
            page = tappedIndex;
          });
        },
      ),
    );
  }
}
