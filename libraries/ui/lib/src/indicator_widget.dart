import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;
  final Color indicatorColor;
  final Color trackColor;
  final double padding;

  const IndicatorWidget(
      {Key? key,
      required this.animController,
      required this.position,
      required this.currentIndex,
      this.padding = 4,
      this.indicatorColor = Colors.red,
      this.trackColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                _buildContainer(
                  double.infinity,
                  position < currentIndex ? indicatorColor : trackColor,
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            indicatorColor,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 8.0,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
    );
  }
}
