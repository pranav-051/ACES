import 'package:aces/constants/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:aces/auth_users/auth_services/authServicesFile.dart';
import 'package:aces/auth_users/login_page.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/components/textField.dart';
import 'package:aces/components/passwordField.dart';
import 'package:aces/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController crnController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();

  bool isPasswordHidden = true;
  String? errorMessage;
  String selectedRole = "User"; // Default selected role for dropdown
  bool isLoading = false;

  final AuthService _authService = AuthService(); // Instance for auth service

  void _signup() async {
    setState(() => isLoading = true);

    String? result = await _authService.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      role: selectedRole,
    );

    setState(() => isLoading = false);

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SignUp Successful! Login Now!!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SignUp Failed! Register Again!! $result")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(AppImages.acesLogo1, width: 150, height: 150),
              const SizedBox(height: 10),

              CustomTextField(
                controller: nameController,
                hintText: "Enter your full name",
                labelText: "Full Name*",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),

              // Email input field
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                labelText: "Email*",
                icon: Icons.email,
              ),
              const SizedBox(height: 20),

              // CRN input field
              CustomTextField(
                controller: crnController,
                hintText: "Enter your CRN",
                labelText: "CRN",
                icon: Icons.perm_identity_rounded,
              ),
              const SizedBox(height: 20),

              // Department input field
              CustomTextField(
                controller: departmentController,
                hintText: "Enter your department",
                labelText: "Department",
                icon: Icons.local_fire_department,
              ),
              const SizedBox(height: 20),

              // College input field
              CustomTextField(
                controller: collegeController,
                hintText: "Enter your college name",
                labelText: "College Name",
                icon: Icons.school,
              ),
              const SizedBox(height: 20),

              // Password input field
              CustomPasswordField(
                controller: passwordController,
                hintText: "Enter your password",
                labelText: "Password*",
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),

              // Confirm Password input field
              CustomPasswordField(
                controller: confirmPasswordController,
                hintText: "Confirm your password",
                labelText: "Confirm Password*",
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),

              // Dropdown for Role selection
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: InputDecoration(
                  labelText: "Role*",
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: "Select your role",
                  hintStyle: const TextStyle(color: AppColors.gray),
                  filled: true,
                  fillColor: AppColors.lightGray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                items: ["Admin", "User"].map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(
                      role,
                      style: const TextStyle(color: AppColors.oxfordBlue),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => selectedRole = newValue!);
                },
              ),
              const SizedBox(height: 30),

              // Signup button
              isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      onPressed: _signup,
                      text: "Register Now",
                      width: double.infinity,
                      textColor: Colors.white,
                      backgroundColor: AppColors.scarletRed,
                    ),
              const SizedBox(height: 20),

              // Already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.scarletRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
