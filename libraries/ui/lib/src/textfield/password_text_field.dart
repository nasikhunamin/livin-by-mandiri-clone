import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText, labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(bool)? onFocusChange;

  const PasswordTextField(
      {super.key,
      this.hintText = "",
      required this.labelText,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.onFocusChange});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;
  var focusNode = FocusNode();

  void onFocusChange() {
    if (widget.onFocusChange != null) {
      widget.onFocusChange!(focusNode.hasFocus);
    }
  }

  @override
  void initState() {
    focusNode.addListener(onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        showCursor: true,
        cursorColor: Colors.blue,
        obscureText: isObscure,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          filled: true,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0)),
          labelText: widget.labelText,
          hintText: widget.hintText,
          labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
          hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
        ),
        maxLines: 1,
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 16.sp, color: Colors.black),
        textAlign: TextAlign.start);
  }
}
