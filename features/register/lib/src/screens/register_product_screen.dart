import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:register/src/screens/info_product_screen.dart';
import 'package:register/src/screens/referral_screen.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class RegisterProductScreen extends StatelessWidget {
  const RegisterProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: "register_product".trans(context),
      onBack: () {
        context.pop();
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16).r,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.all(const Radius.circular(16).r),
          child: Container(
            alignment: Alignment.topCenter,
            height: 550.h,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(16).r),
                color: ColorPalletes.lightBlue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyNetworkImage(
                    height: 250.h,
                    url:
                        "https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image1.png"),
                const Text(
                  "Open Savings Account Without Hassle, Just Need",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text.rich(TextSpan(
                    text:
                        "With a 100K initial deposit, you can start exploring exciting features. ",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 18.sp,
                    ),
                    children: [
                      WidgetSpan(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InfoProductScreen()));
                        },
                        child: Text(
                          "More info",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.sp,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                    ])),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReferrealScreen()));
                  },
                  child: const Text(
                    "Have a Referreal Code? Tap Here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RoundedButton(
                  text: "Open Account Now",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
