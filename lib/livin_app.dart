import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livin_clone/screens/splash/splash_screen.dart';

class LivinApp extends StatelessWidget {
  const LivinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livin-Clone",
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          colorSchemeSeed: Colors.blue,
          fontFamily: "Poppins"),
      home: const SplashScreen(),
    );
  }
}

void startApp() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const LivinApp());
}
