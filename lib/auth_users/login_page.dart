import 'package:flutter/material.dart';
import 'package:aces/auth_users/auth_services/authServicesFile.dart';
import 'package:aces/auth_users/register_page.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/userHome/bottomNavBar/main_bottom_navigation.dart';
import 'package:aces/components/textField.dart';
import 'package:aces/components/passwordField.dart';
import '../adminHome/admin_page.dart';
import 'package:aces/constants/AppImages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool isLoading = false;

  Future <void> login() async {
    setState(() => isLoading = true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);

    String? result = await _authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() => isLoading = false);

    if (result == "Admin") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => const admin_page(title: 'Admin Pages')),
          (route) => false,
      );
    } else if (result == "User") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => const mainBottomNav(title: "User Page")),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed! $result")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 340,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.acesLogo1, height: 180),
                const SizedBox(height: 20),

                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  labelText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),

                CustomPasswordField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                  icon: Icons.lock,
                ),
                const SizedBox(height: 30),

                isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        onPressed: login,
                        text: "Login Now",
                        width: double.infinity,
                        textColor: Colors.white,
                        backgroundColor: AppColors.scarletRed,
                      ),
                const SizedBox(height: 20),

                const Text(
                  "or sign-up using",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Image.asset(AppImages.google),
                        iconSize: 5,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.facebook),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.microsoft),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.tweeter),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Signup here",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.roseRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
