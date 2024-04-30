import 'package:flutter/material.dart';

class SpaceBar extends StatelessWidget {
  final double height, width;

  const SpaceBar({super.key, this.height = 0, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
