import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ProgressScaffoldWidget extends StatelessWidget {
  final double progress;
  final Widget child;

  const ProgressScaffoldWidget(
      {super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        leadingWidth: 24,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.grey,
        ),
        title: SizedBox(
          height: 4,
          width: double.infinity,
          child: LinearProgressIndicator(
            value: progress,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade200,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32).r,
        child: child,
      )),
    );
  }
}
