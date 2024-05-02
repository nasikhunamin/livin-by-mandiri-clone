import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:livin_clone/screens/onboarding/onboarding.dart';
import 'package:livin_clone/screens/onboarding/onboarding_content_widget.dart';
import 'package:livin_clone/screens/onboarding/switch_language_widget.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            OnboardingContentWidget(data: onboardings),
            Positioned(
                top: 32.h, right: 8.w, child: const SwitchLanguageWidget()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    text: "register_account".trans(context),
                    onPressed: () {},
                    fontSize: 16.sp,
                  ),
                  8.verticalSpace,
                  OutlineRoundedButton(
                    text: "login_account".trans(context),
                    onPressed: () {},
                    fontSize: 16.sp,
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
