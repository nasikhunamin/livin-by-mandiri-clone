import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dependencies/dependencies.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

/// The `CaptureController` class provides methods for capturing and cropping images.
/// It includes a static method `cropImage` that takes a [File] representing an image,
/// crops it based on a fixed width with a 3:2 aspect ratio, and returns the cropped image path.
class CaptureController {
  /// Static method to crop an image and return the cropped image.
  ///
  /// The method takes a [File] `imageFile` representing the original image to be cropped.
  /// It calculates a fixed width based on a 3:2 aspect ratio and crops the image
  /// to that width, centered vertically. The cropped image is then saved to a temporary file,
  /// and the [XFile] representing the path of the cropped image is returned.
  ///
  /// Example:
  /// ```dart
  /// File imageFile = ...; // The original image file
  /// XFile? croppedImage = await CaptureController.cropImage(imageFile);
  /// print('Cropped image path: ${croppedImage?.path}');
  /// ```
  static Future<File?> cropImage(File imageFile) async {
    // Read the image file
    List<int> imageBytes = await imageFile.readAsBytes();
    img.Image originalImage = img.decodeImage(Uint8List.fromList(imageBytes))!;

    // Define the fixed width based on a 3:2 aspect ratio
    int width =
        originalImage.width - 48; // Remove 24 pixels from both left and right
    int height = (2 * width) ~/ 3;

    // Calculate the cropping rectangle centered on the modified width
    int x = 24; // Offset to remove 24 pixels from the left
    int y = (originalImage.height - height) ~/ 3;

    // Crop the image
    img.Image croppedImage = img.copyCrop(
      originalImage,
      x: x,
      y: y,
      width: width,
      height: height,
    );

    // Convert the cropped image to bytes
    Uint8List croppedBytes = Uint8List.fromList(img.encodePng(croppedImage));

    // Generate a unique filename using the current timestamp
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    Directory tempDir = await getTemporaryDirectory();

    String tempPath = '${tempDir.path}/cropped_image_$timestamp.png';

    // Save the cropped image to the new temporary file
    await File(tempPath).writeAsBytes(croppedBytes);

    // Return the cropped image path as a [XFile]
    return File(tempPath);
  }
}
