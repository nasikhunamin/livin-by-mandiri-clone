import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import '../routes/register_route.dart';

class ReferrealScreen extends StatefulWidget {
  const ReferrealScreen({super.key});

  @override
  State<ReferrealScreen> createState() => _ReferrealScreenState();
}

class _ReferrealScreenState extends State<ReferrealScreen> {
  final referralController = TextEditingController(text: '');
  final branchController = TextEditingController(text: '');

  @override
  void dispose() {
    referralController.dispose();
    branchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithScrollWidget(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Referral Code",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            24.verticalSpace,
            MyNetworkImage(
                height: 240.h,
                url:
                    "https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image1.png"),
            32.verticalSpace,
            Text(
              "Input the code that you have received. if you don't have any, tap \"Next\"!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
            ),
            32.verticalSpace,
            FilledTextField(
              controller: referralController,
              labelText: "Referral code (if Any)",
            ),
            16.verticalSpace,
            FilledTextField(
              controller: branchController,
              labelText: "Branch code (if Any)",
              keyboardType: TextInputType.number,
            ),
            32.verticalSpace,
            RoundedButton(
              text: "Continue open Account",
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                RegisterNavigation.navigateToSelectDebitCard(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
