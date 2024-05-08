import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class FilledTextField extends StatelessWidget {
  final String hintText, labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const FilledTextField(
      {super.key,
      this.hintText = "",
      required this.labelText,
      this.keyboardType = TextInputType.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      showCursor: true,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        filled: true,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0)),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
        hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
      ),
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Poppins', fontSize: 16.sp, color: Colors.black),
      textAlign: TextAlign.start,
    );
  }
}
