import 'package:flutter/material.dart';
import 'package:livin_clone/screens/onboarding/onboarding.dart';
import 'package:livin_clone/screens/onboarding/onboarding_content_widget.dart';
import 'package:livin_clone/screens/onboarding/switch_language_widget.dart';
import 'package:localizations/l10n/ext.dart';
import 'package:register/register.dart';
import 'package:dependencies/dependencies.dart';
import 'package:ui/ui.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    List<Onboarding> onboardings = [
      Onboarding(
          'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image1.png',
          context.l10n.onboarding1,
          context.l10n.descOnboarding1),
      Onboarding(
          'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image2.png',
          context.l10n.onboarding2,
          context.l10n.descOnboarding2),
      Onboarding(
          'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image3.png',
          context.l10n.onboarding3,
          context.l10n.descOnboarding3)
    ];

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedButton(
                      text: context.l10n.registerAccount,
                      onPressed: () {
                        context.goNamed(RegisterRoute.register.name);
                      },
                      fontSize: 16.sp,
                    ),
                    8.verticalSpace,
                    OutlineRoundedButton(
                      text: context.l10n.loginAccount,
                      onPressed: () {},
                      fontSize: 16.sp,
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
