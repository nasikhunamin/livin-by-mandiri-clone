import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class RoundedButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final bool infinity;
  final double padding;
  final Function()? onPressed;

  const RoundedButton(
      {super.key,
      this.fontSize = 16,
      this.onPressed,
      required this.text,
      this.padding = 16,
      this.infinity = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (infinity) ? double.infinity : null,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              disabledBackgroundColor: Colors.blue.shade200,
              shape: const StadiumBorder(),
              padding: EdgeInsets.all(padding).r),
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
