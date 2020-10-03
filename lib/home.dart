import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome_ui/CONSTANTS.dart';
import 'package:smarthome_ui/screens/main_page.dart';
import 'package:smarthome_ui/screens/power_page.dart';
import 'package:smarthome_ui/screens/setting_page.dart';
import 'package:smarthome_ui/screens/user_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainPage(),
    UserPage(),
    PowerPage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: accentColour, opacity: 1),
          unselectedIconTheme:
              IconThemeData(opacity: 0.4), //opacity ranged from 0 to 1
          iconSize: 18,

          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userFriends),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bolt),
              label: 'Power',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cog),
              label: 'Setting',
            ),
          ],
          onTap: (itemIndex) {
            setState(() {
              _currentIndex = itemIndex;
            });
          },
        ),
      ),
      extendBody: true,
      body: SafeArea(bottom: false, child: _children[_currentIndex]),
    );
  }
}

//https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
