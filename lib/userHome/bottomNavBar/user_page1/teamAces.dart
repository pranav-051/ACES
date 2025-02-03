import 'package:aces/userHome/bottomNavBar/main_bottom_navigation.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class teamAces extends StatelessWidget {
  const teamAces ({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const mainBottomNav(title: "MAIN BOTTOM NAV")),
              );
            },
          ),
          title: const CustomText(
            text: "Team Aces",
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/teams/leads.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/techTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/webTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/editorialTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/eventTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/treasuryTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/mediaTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
            Image.asset(
              'assets/teams/d&PTeam.heic',
              fit: BoxFit.fill,
            ),
            const Divider(),
          ],
        ),),
      )
    );
  }
}
