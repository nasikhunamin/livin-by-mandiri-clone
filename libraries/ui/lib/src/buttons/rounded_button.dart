import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class RoundedButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final bool infinity;
  final Function()? onPressed;

  const RoundedButton(
      {super.key,
      this.fontSize = 16,
      this.onPressed,
      required this.text,
      this.infinity = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (infinity) ? double.infinity : null,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.all(16).r),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}
