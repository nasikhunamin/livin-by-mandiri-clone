import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

import 'config_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            MyNetworkImage(
              url:
                  "https://www.pngkey.com/png/full/666-6663236_blue-header-png-6-png-image-blue.png",
              fit: BoxFit.fill,
              height: 80.h,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 16, right: 16).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text.rich(TextSpan(
                      text: "Selamat Pagi, ",
                      style: TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.blue),
                      children: [
                        WidgetSpan(
                            child: Text(
                          "Livia",
                          style: TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                              fontSize: 20.sp),
                        ))
                      ])),
                  8.verticalSpace,
                  const ConfigMenuWidget()
                ],
              ),
            ),
          ],
        ));
  }
}
