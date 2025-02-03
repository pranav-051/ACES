import 'package:aces/SidebarNavPages/SideNavPage7.dart';
import 'package:aces/auth_users/auth_services/user_model.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/welcome_page.dart';
import 'package:flutter/material.dart';
import '/SidebarNavPages/profile_page.dart';
import '/SidebarNavPages/setting_page.dart';
import '/SidebarNavPages/faqs_page.dart';
import '/SidebarNavPages/privacy_policy_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:share_plus/share_plus.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final String _content =
      'My Instagram account link: https://www.instagram.com/accounts/login/';
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final _dialog = RatingDialog(
    starSize: 35,
    title: const Text(
      'ACES',textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.redColor,
          fontWeight: FontWeight.w500,
          fontSize: 25),
    ),
    message: const Text(
      'Rate us 5* and support us ☺️', textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.scarletColor,
          fontWeight: FontWeight.w300,
          fontSize: 18),
    ),
    image: Image.asset(
      "assets/acesLogo1.png",
      width: 90,
      height: 90,
      fit: BoxFit.contain,
    ),
    submitButtonText: 'Submit',
    onSubmitted: (response) {
      if (response.rating < 3.0) {
        // Handle low ratings
      } else {
        StoreRedirect.redirect(
            androidAppId: 'com.example.aces2',
            iOSAppId: 'com.example.aces2');
      }
    },
  );

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            loggedInUser =
                UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
          });
        }
      } catch (e) {
        print("Error fetching user details: $e");
      }
    }
  }

  void _shareContent(BuildContext context) {
    Share.share(_content);
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      elevation: 5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.scarletColor),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/acesLogo.png",
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              loggedInUser.name ?? "User Name",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              loggedInUser.email ?? "User Email",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildListTile(
            icon: Icons.account_circle_outlined,
            title: 'Profile',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfilePage()),
            ),
          ),
          _buildListTile(
            icon: Icons.share_sharp,
            title: 'Share',
            onTap: () => _shareContent(context),
          ),
          _buildListTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SettingsPage(onThemeChanged: (ThemeMode) {})),
            ),
          ),
          _buildListTile(
            icon: Icons.star_rate_outlined,
            title: 'Rate Us',
            onTap: () => showDialog(
              context: context,
              builder: (context) => _dialog,
            ),
          ),
          _buildListTile(
            icon: Icons.help_outline_outlined,
            title: 'Help Center',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SideNavPage5(title: 'SideNavPage5')),
            ),
          ),
          _buildListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SideNavPage6()),
            ),
          ),
          _buildListTile(
            icon: Icons.developer_mode_sharp,
            title: 'Developers',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfileGrid()),
            ),
          ),
          _buildListTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => logout(context),
          ),
          const Divider(
            thickness: 0.4,
            color: AppColors.scarletColor,
          ),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Version: 1.0.1",
              style: TextStyle(
                  fontWeight: FontWeight.w300, color: AppColors.oxfordBlue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.scarletColor),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
      onTap: onTap,
    );
  }
}
