import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'scaffold_widget.dart';

class ScaffoldWithScrollWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final Function()? onBack;

  const ScaffoldWithScrollWidget(
      {super.key, this.title = "", this.onBack, required this.child});

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
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        child: child,
      )),
    );
  }
}
