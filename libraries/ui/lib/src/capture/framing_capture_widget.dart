import 'package:flutter/material.dart';

import 'id_widget.dart';

/// `FramingCaptureWidget` is a Flutter widget designed to create a framing overlay
/// with customizable border and a central rectangular area. It is commonly used
/// for framing an ID card or similar elements in a camera capture view.

class FramingCaptureWidget extends StatelessWidget {
  /// Constructs a `FramingCaptureWidget`.
  ///
  /// Parameters:
  /// - `hideIdWidget`: A boolean indicating whether to hide the `IdWidget` in the center.
  const FramingCaptureWidget({
    super.key,
    required this.hideIdWidget,
  });

  /// Determines whether the `IdWidget` in the center should be hidden.
  final bool hideIdWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Border styling for the framing overlay
      decoration: BoxDecoration(
        border: Border(
          left: const BorderSide(
            color: Colors.black54,
            width: 10,
          ),
          right: const BorderSide(
            color: Colors.black54,
            width: 10,
          ),
          bottom: BorderSide(
            color: Colors.black54,
            width: MediaQuery.of(context).size.height * 0.4,
          ),
          top: BorderSide(
            color: Colors.black54,
            width: MediaQuery.of(context).size.height * 0.24,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Centered container with customizable border
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 3, color: Colors.white),
                ),
              ),
              // Display the IdWidget in the center, unless explicitly hidden
              child: hideIdWidget ? null : const IdWidget(),
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     width: double.infinity,
          //     decoration: ShapeDecoration(
          //       color: Colors.transparent,
          //       shape: OnlySideShapeBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         topLeftCornerSide:
          //             const BorderSide(color: Colors.red, width: 3),
          //         topRightCornerSide:
          //             const BorderSide(color: Colors.red, width: 3),
          //         bottomLeftCornerSide:
          //             const BorderSide(color: Colors.red, width: 3),
          //         bottomRightCornerSide:
          //             const BorderSide(color: Colors.red, width: 3),
          //       ),
          //     ),
          //     // Display the IdWidget in the center, unless explicitly hidden
          //     child: hideIdWidget ? null : const IdWidget(),
          //   ),
          // ),
          // Color-filtered background for framing overlay
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black54,
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
