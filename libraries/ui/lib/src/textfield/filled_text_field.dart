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
          border: const UnderlineInputBorder(),
          labelText: labelText,
          hintText: hintText),
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Poppins', fontSize: 14.sp, color: Colors.black),
      textAlign: TextAlign.start,
      onChanged: (value) {
        controller.text = value;
        controller.selection = TextSelection.collapsed(offset: value.length);
      },
    );
  }
}
