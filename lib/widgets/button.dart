import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.width,
    this.height,
    this.margin,
    required this.title,
    this.textStyle,
    required this.onPressed,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsiveSize(10)),
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.indigo,
            Color.fromARGB(255, 121, 35, 220)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.responsiveSize(10)),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent, // Ensure the gradient shows
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
