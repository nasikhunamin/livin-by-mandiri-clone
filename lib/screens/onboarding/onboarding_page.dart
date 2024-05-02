import 'package:flutter/material.dart';
import 'package:livin_clone/screens/onboarding/onboarding.dart';
import 'package:livin_clone/screens/onboarding/onboarding_content_widget.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            OnboardingContentWidget(data: onboardings),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    text: "Belum punya Rekening Mandiri",
                    onPressed: () {},
                  ),
                  8.verticalSpace,
                  OutlineRoundedButton(
                    text: "Punya Kartu Debit/Kredit Mandiri",
                    onPressed: () {},
                  ),
                  16.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
