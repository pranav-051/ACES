import 'package:aces/auth_users/login_page.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/AppImages.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/userHome/bottomNavBar/main_bottom_navigation.dart';
import 'package:aces/auth_users/register_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'adminHome/admin_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, this.title});
  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _slider() {
    final List<String> sliderImages = [
      AppImages.sliderImg1,
      AppImages.sliderImg2,
      AppImages.sliderImg3,
      AppImages.sliderImg4,
    ];

    return CarouselSlider(
      items: sliderImages.map((imagePath) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 530,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 15,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 100),
        viewportFraction: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              _slider(),
              const Divider(color: Colors.red, thickness: 0.5),
              const SizedBox(height: 40),
              _buildButton("Login Now", AppColors.scarletRed, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }),
              const SizedBox(height: 20),
              _buildButton("Register Now", null, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              }),
              const SizedBox(height: 130),
              _buildButton("User Backdoor", null, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mainBottomNav(title: "User Pages")),
                );
              }),
              const SizedBox(height: 30),
              _buildButton("Admin Backdoor", null, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const admin_page(title: "Admin pages")),
                );
              }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color? backgroundColor, VoidCallback onPressed) {
    return CustomButton(
      onPressed: onPressed,
      text: text,
      width: 280,
      textColor: AppColors.roseRedColor,
      backgroundColor: AppColors.lightGray,
    );
  }
}
