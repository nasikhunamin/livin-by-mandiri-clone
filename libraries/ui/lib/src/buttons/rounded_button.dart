import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final Function()? onPressed;

  const RoundedButton(
      {super.key, this.fontSize = 12, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.all(16)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}
