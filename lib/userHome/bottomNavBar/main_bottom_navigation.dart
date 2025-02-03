import 'package:aces/userHome/bottomNavBar/home_page.dart';
import 'package:aces/userHome/bottomNavBar/tech_nontech_events.dart';
import 'package:aces/userHome/bottomNavBar/leaderboard.dart';
import 'package:aces/userHome/bottomNavBar/aboutAces.dart';
import 'package:flutter/material.dart';
import 'package:aces/constants/colors.dart';


class mainBottomNav extends StatefulWidget {
  const mainBottomNav({super.key, required this.title});
  final String title;
  @override
  State<mainBottomNav> createState() => _mainBottomNav();
}

class _mainBottomNav extends State<mainBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = <Widget>
    [
      const Page1(title: "Page1",),
      Page2(title: "Page2",),
      const Leaderboard(title: "Page3",),
      const Page4(title: "Page4",),
    ];

    return Scaffold(
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),

        bottomNavigationBar: BottomNavigationBar(
          elevation: 25, //border light dark
          iconSize: 25, //size of icon
          selectedFontSize: 10,
          // this is a code which execute when the items will select
          selectedIconTheme: const IconThemeData(color: Colors.black, size: 27),
          selectedItemColor: Colors.black,
          //selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.red),

          items: const <BottomNavigationBarItem>[
            //first Page
            BottomNavigationBarItem(
               // backgroundColor: Colors.white,
                icon: Icon(Icons.home,color: AppColors.gray,),
                label: 'Home'
            ),

            //Second Page
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note, color: AppColors.gray),
              label: 'Events',
            ),

            //Third Page
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_sharp, color: AppColors.gray),
              label: 'Leader Board',
            ),

            //Fourth Page
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded, color: AppColors.gray),
              label: 'About ACES',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }
}
