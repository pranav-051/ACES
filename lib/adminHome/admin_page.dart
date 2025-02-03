import 'package:aces/SidebarNavPages/main_left_panel.dart';
import 'package:aces/adminHome/update_events.dart';
import 'package:aces/adminHome/update_leaderboard.dart';
import 'package:aces/components/button_multiline.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/AppImages.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/userHome/bottomNavBar/tech_nontech_events.dart';
import 'package:flutter/material.dart';

import '../components/text.dart';

class admin_page extends StatefulWidget {
  const admin_page({super.key, required this.title});
  final String title;
  @override
  State<admin_page> createState() => _admin_page();
}

class _admin_page extends State<admin_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar( backgroundColor: AppColors.scarletRed,
        iconTheme: const IconThemeData(size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'Admin Home',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomMultilineButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const upload_leaderboard(title: 'uploadLeaderboard',),
                    ),
                  );
                },
                icon: Image.asset(AppImages.bePart, width: 50,),
                text1: 'Update', text2: 'Leaderboard',
              ),

              const SizedBox(height: 15,),

              CustomMultilineButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChangeEvent(title: "Tech and non-tech events")
                    ),
                  );
                },
                icon: Image.asset(AppImages.bePart, width: 50,),
                text1: "Tech &",
                text2: "Non-Tech Events",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
