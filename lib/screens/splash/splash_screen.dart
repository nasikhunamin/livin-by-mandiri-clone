import 'package:config/config.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (locator.get<SharedPrefHelper>().isLogin()) {
        context.goNamed(LivinRoutes.main.name);
      } else {
        context.goNamed(LivinRoutes.onboarding.name);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Assets.logo.livinSplashLogo.image(fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32, left: 8, right: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  const SpaceBar(
                    height: 32,
                  ),
                  Assets.logo.lpsLogo.image(height: 56),
                  const SpaceBar(
                    height: 8,
                  ),
                  Text(
                    "PT Bank Mandiri (Persero) Tbk. berizin dan diawasi oleh otoritas jasa keuangan (OJK) serta merupakan peserta penjaminan Lembaga Pinjaman Simpanan (LPS)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, height: 1.2, fontSize: 14.sp),
                  ),
                  const SpaceBar(
                    height: 8,
                  ),
                  Text(
                    "Copyright © 2024 Bank Mandiri",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
