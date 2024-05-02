import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livin_clone/navigation/livin_router.dart';
import 'package:shared/shared.dart';

class LivinApp extends StatelessWidget {
  const LivinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Livin-Clone",
      builder: (context, child) {
        ScreenUtil.init(context);
        return child ?? const SizedBox.shrink();
      },
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          colorSchemeSeed: Colors.blue,
          fontFamily: "Poppins"),
      routerConfig: livinRouter,
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
