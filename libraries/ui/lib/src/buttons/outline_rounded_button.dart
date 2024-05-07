import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class OutlineRoundedButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final bool infinity;
  final double padding;
  final Function()? onPressed;

  const OutlineRoundedButton(
      {super.key,
      this.fontSize = 16,
      this.onPressed,
      required this.text,
      this.infinity = true,
      this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: infinity ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue),
            shape: const StadiumBorder(),
            padding: EdgeInsets.all(padding).r),
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
