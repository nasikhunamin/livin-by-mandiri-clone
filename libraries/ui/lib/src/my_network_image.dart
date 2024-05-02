import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final BoxFit fit;
  final Widget? placeholder, error;

  const MyNetworkImage(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.placeholder,
      this.error});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: placeholder != null ? (context, url) => placeholder! : null,
      errorWidget: error != null ? (context, url, _) => error! : null,
    );
  }
}
