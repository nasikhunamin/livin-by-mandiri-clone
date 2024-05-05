import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final Function()? onBack;

  const ScaffoldWidget({
    super.key,
    this.title = "",
    this.onBack,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: onBack ?? () => Navigator.of(context).pop(),
          color: Colors.grey,
        ),
        title: ScaffoldTitle(title: title, fontSize: 18.sp),
      ),
      body: SafeArea(child: child),
    );
  }
}

class ScaffoldTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const ScaffoldTitle({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: fontSize),
    );
  }
}
