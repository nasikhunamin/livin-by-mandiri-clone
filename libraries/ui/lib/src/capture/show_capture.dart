import 'dart:io';

import 'package:flutter/material.dart';

import 'capture_view.dart';

/// The `showCapture` function displays a capture screen using the device's camera
/// to allow users to capture images. It returns a [Future<XFile?>] representing
/// the path of the captured and cropped image, or `null` if the capture process is canceled.
///
/// Parameters:
/// - `context`: The [BuildContext] used to show the capture dialog.
/// - `title`: The title displayed at the top of the capture screen.
/// - `info`: Additional information or instructions displayed on the capture screen.
///
/// Example:
/// ```dart
/// XFile? capturedImage = await showCapture(
///   context: context,
///   title: 'Capture Image',
///   info: 'Align the document within the frame and tap the capture button.',
/// );
/// if (capturedImage != null) {
///   print('Captured image path: ${capturedImage.path}');
/// } else {
///   print('Capture canceled.');
/// }
/// ```
Future<File?> showCapture({
  required BuildContext context,
  bool? hideIdWidget,
}) async {
  // return showDialog<File?>(
  //   context: context,
  //   builder: (context) => CaptureView(
  //     fileCallback: (imagePath) {},
  //     title: title,
  //     info: info,
  //     hideIdWidget: hideIdWidget,
  //   ),
  // );
  File? result = await Navigator.of(context).push<File?>(MaterialPageRoute(
      builder: (builder) => CaptureView(
          fileCallback: (imagePath) {},
          hideIdWidget: hideIdWidget)));
  return result;
}
