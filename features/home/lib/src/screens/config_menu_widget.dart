import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ConfigMenuWidget extends StatelessWidget {
  const ConfigMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyNetworkImage(
          url:
              "https://static.vecteezy.com/system/resources/previews/017/639/144/non_2x/account-has-been-registered-login-success-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
          height: 100.h,
          width: 100.h,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                16.verticalSpace,
                Text(
                  "Mau transfer, bayar, dan top up lebih cepat?",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                ),
                4.verticalSpace,
                RoundedButton(
                  text: "Atur Sekarang",
                  padding: 0,
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
