import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class OutlineRoundedButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final Function()? onPressed;

  const OutlineRoundedButton(
      {super.key, this.fontSize = 16, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.all(16).r),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
      ),
    );
  }
}
