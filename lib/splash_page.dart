import 'dart:async';
import 'package:aces/constants/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:aces/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {  // Adjust duration if needed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Takes full width without MediaQuery
        color: Colors.black,
        alignment: Alignment.center,
        child: Image.asset(AppImages.splashImage, width: 200, fit: BoxFit.fill),
      ),
    );
  }
}
