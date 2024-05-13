import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SucessfulRegister extends StatelessWidget {
  const SucessfulRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32).r,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                48.verticalSpace,
                Text(
                  "Registrasi Berhasil",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                8.verticalSpace,
                Text(
                  "Akun mandiri anda berhasil dibuat",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
                ),
                32.verticalSpace,
                const MyNetworkImage(
                  url:
                      "https://static.vecteezy.com/system/resources/previews/017/639/144/non_2x/account-has-been-registered-login-success-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
                  fit: BoxFit.fill,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                text: "Masuk ke Beranda",
                onPressed: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
