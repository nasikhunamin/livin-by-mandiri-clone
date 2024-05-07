import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dependencies/dependencies.dart';

import 'package:flutter/material.dart';
import 'package:ui/src/capture/button_take.dart';
import 'package:ui/ui.dart';

/// CaptureView is a Flutter widget for capturing images using the device's camera.
/// It provides a user interface with a live camera preview, framing guides,
/// and a capture button. After capturing an image, it can be cropped and processed
/// before being passed to a callback function.
class CaptureView extends StatefulWidget {
  /// Creates a new instance of [CaptureView].
  ///
  /// The required parameters are:
  /// - [fileCallback]: A callback function that will be called with the captured and cropped image.
  /// - [title]: The title displayed at the top of the capture screen.
  ///
  /// The optional parameter is:
  /// - [info]: Additional information or instructions displayed on the capture screen.
  const CaptureView(
      {Key? key, required this.fileCallback, this.hideIdWidget = true})
      : super(key: key);

  /// Callback function that receives the captured and cropped image as an [XFile].
  final Function(File imagePath) fileCallback;

  final bool? hideIdWidget;

  @override
  State<CaptureView> createState() => _CaptureViewState();
}

class _CaptureViewState extends State<CaptureView> with WidgetsBindingObserver {
  CameraController? controller;

  File? resultImage;

  Future<void> initializeCameras() async {
    await Permission.camera.request();
    var cameras = await availableCameras();
    controller = CameraController(
        cameras.isEmpty ? getDefaultCameraDescription() : cameras[0],
        ResolutionPreset.medium);

    // If the controller is updated then update the UI.
    controller?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    await controller?.initialize();
    controller?.setFlashMode(FlashMode.off);
  }

  /// Retrieves the default camera description with placeholder values.
  CameraDescription getDefaultCameraDescription() {
    return const CameraDescription(
      name: "default",
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 180,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initializeCameras();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCameras();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || controller?.value.isInitialized == false) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        showExitDialog();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            // Live camera preview.
            resultImage == null
                ? CameraPreview(controller!)
                : Image.file(
                    resultImage!,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
            // Framing guides around the capture area.
            FramingCaptureWidget(
              hideIdWidget: widget.hideIdWidget ?? true,
            ),
            // Capture button at the bottom center.
            Align(
              alignment: Alignment.bottomLeft,
              child: ButtonTake(
                onSubmit: () {
                  cropImage().then((value) => Navigator.pop(context, value));
                },
                onRetake: () {
                  setState(() {
                    resultImage = null;
                  });
                },
                retake: resultImage == null,
                controller: controller!,
                fallback: (p0) {
                  setState(() {
                    resultImage = p0;
                  });
                },
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(vertical: 16).r,
                width: double.infinity,
                height: 48,
                color: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 24,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    showExitDialog();
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<File?> cropImage() async {
    if (resultImage == null) return Future.error("Result image null");
    // Crop the captured image.
    File? croppedImage = await CaptureController.cropImage(
      resultImage!,
    );

    // Callback to handle the cropped image.
    widget.fileCallback(File(resultImage!.path));

    return croppedImage;
  }

  void showExitDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Leave e-KTP verification page?",
              textAlign: TextAlign.start),
          content: const Text(
              "Leaving this page would cancel the verification process."),
          actions: [
            TextButton(
              child: const Text("Quit"),
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            ),
            TextButton(
              child: const Text("Retry"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
