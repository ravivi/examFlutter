import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:exam/pages/edit.dart';
import 'package:exam/pages/home.dart';
import 'package:exam/pages/ind.dart';
import 'package:exam/pages/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavState();
  }
}

class NavState extends State<Nav> {
  int _pageindex = 0;
  void onItemTapped(int index) {
    setState(() {
      _pageindex = index;
    });
  }

  final _pageContent = [
    Home(),
    Edit(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: BubbleBottomBar(
          backgroundColor: Colors.grey[100],
          opacity: 1,
          elevation: 0,
          currentIndex: _pageindex,
          onTap: onItemTapped,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.blueAccent,
                icon: Icon(FontAwesomeIcons.home, color: Colors.black),
                activeIcon: Icon(FontAwesomeIcons.home, color: Colors.white),
                title: Text(
                  "Accueil",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.edit, color: Colors.black),
                activeIcon: Icon(Icons.edit, color: Colors.white),
                title: Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.purpleAccent,
                icon: Icon(Icons.favorite, color: Colors.black),
                activeIcon: Icon(Icons.favorite, color: Colors.white),
                title: Text(
                  "Paramètres",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      body: _pageContent.elementAt(_pageindex),
    );
  }
}
