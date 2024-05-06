import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InfoProductScreen extends StatelessWidget {
  const InfoProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: Stack(children: [
            WebWidget(
              url: "https://pub.dev/packages/webview_flutter",
              onLoadUrl: (url) {},
              onLoading: () {},
            ),
            Positioned(
                right: 16,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 230, 230, 230)),
                  child: IconButton(
                    iconSize: 24.sp,
                    icon: const Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
          ]),
        ));
  }
}
