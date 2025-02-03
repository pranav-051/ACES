import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomMultilineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text1;
  final String text2;
  final Color backgroundColor;
  final Color? textColor; // Optional text color parameter
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double? height; // Optional height parameter
  final double? width; // Optional width parameter
  final double borderRadius; // Customizable border radius
  final double elevation; // Customizable elevation
  final Widget? icon; // Optional icon parameter

  const CustomMultilineButton({
    super.key,
    required this.onPressed,
    required this.text1,
    required this.text2,
    this.backgroundColor = AppColors.lightGray2,
    this.textColor = Colors.black, // Default to black for the theme
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    this.height, // Initialize height
    this.width, // Initialize width
    this.borderRadius = 20.0, // Increased border radius
    this.elevation = 5.0, // Increased elevation for depth
    this.icon, // Optional icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: Size(width ?? 100, height ?? 50), // Use default if null
        backgroundColor: backgroundColor, // Background color
        padding: padding, // Padding
        elevation: elevation, // Elevation for shadow
        shadowColor: Colors.redAccent.withOpacity(0.4), // Shadow color
        foregroundColor: Colors.red.withOpacity(0.8),
        animationDuration: const Duration(seconds: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Shrinks to fit the content
        children: [
          // Icon or default image
          icon??
              const Icon(
                Icons.image,  // Default icon
                size: 50,
                color: Colors.black,
              ),
          const SizedBox(width: 8), // Spacing between icon and text
          Column(
            mainAxisSize: MainAxisSize.min, // Shrinks to fit the content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: textStyle.copyWith(
                  color: textColor ?? textStyle.color,
                  fontSize: 16, // Slightly larger font for better readability
                ),
              ),
              const SizedBox(height: 4), // Spacing between text lines
              Text(
                text2,
                style: textStyle.copyWith(
                  color: textColor ?? textStyle.color,
                  fontSize: 14, // Slightly smaller font for the second line
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}