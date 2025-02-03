import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color? textColor; // Optional text color parameter
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final BorderSide? borderSide;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.lightGray,
    this.textColor,
    this.textStyle =
    const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 280,
        height: height ?? 50,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor ?? AppColors.scarletRed,
            width: borderWidth ?? 1.5, // Default border width
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey,
              spreadRadius: 1,
              offset: Offset(2, 3), // Slight elevation effect
            ),
          ],
        ),
        child: Text(
          text,
          style: textStyle.copyWith(
            color: textColor ?? textStyle.color,
            fontSize: 18,
            fontWeight: FontWeight.w400, // Slightly lighter than before
          ),
        ),
      ),
    );
  }
}
