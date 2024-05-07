import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class ButtonTake extends StatefulWidget {
  final CameraController controller;
  final Function(File?) fallback;
  final bool retake;
  final Function() onRetake;
  final Function() onSubmit;

  const ButtonTake(
      {super.key,
      required this.controller,
      required this.fallback,
      required this.retake,
      required this.onRetake,
      required this.onSubmit});

  @override
  State<ButtonTake> createState() => _ButtonTakeState();
}

class _ButtonTakeState extends State<ButtonTake> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Place your e-KTP within the frame and take a picture",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.poppins,
                fontSize: 12.sp),
          ),
          widget.retake
              ? Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    enableFeedback: true,
                    color: Colors.blue,
                    onPressed: () {
                      captureImage();
                    },
                    icon: const Icon(
                      Icons.circle,
                    ),
                    iconSize: 72,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlineRoundedButton(
                      text: "Retake",
                      padding: 0,
                      onPressed: () {
                        widget.onRetake();
                      },
                      infinity: false,
                    ),
                    16.horizontalSpace,
                    RoundedButton(
                      text: "Submit",
                      padding: 0,
                      onPressed: () {
                        widget.onSubmit();
                      },
                      infinity: false,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Future<void> captureImage() async {
    // Capture an image.
    XFile file = await widget.controller.takePicture();

    // // Crop the captured image.
    // File? croppedImage = await CaptureController.cropImage(
    //   File(file.path),
    // );

    setState(() {
      widget.fallback(File(file.path));
    });
  }
}
