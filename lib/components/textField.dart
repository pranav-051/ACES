import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;

  // Constructor to pass values to the TextField widget
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black, height: 1),
      keyboardType: keyboardType, // Use the provided keyboardType
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.gray),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Match border radius
          borderSide: const BorderSide(color: Colors.black), // Match border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Match border radius
          borderSide: const BorderSide(color: Colors.black), // Match enabled border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Match border radius
          borderSide: const BorderSide(color: Colors.black), // Match focused border color
        ),
        prefixIcon: Icon(icon, color: AppColors.gray), // Icon color
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15), // Match content padding
      ),
    );
  }
}