import 'package:flutter/material.dart';
import 'package:register/register.dart';
import 'package:register/src/screens/widgets/progress_scaffold_widget.dart';
import 'package:ui/ui.dart';

class InputOtpScreen extends StatefulWidget {
  const InputOtpScreen({super.key});

  @override
  State<InputOtpScreen> createState() => _InputOtpScreenState();
}

class _InputOtpScreenState extends State<InputOtpScreen> {
  TextEditingController controller = TextEditingController(text: "");

  bool resend = false;

  @override
  Widget build(BuildContext context) {
    return ProgressScaffoldWidget(
        progress: 0.6,
        scaffoldState: null,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Masukkan OTP",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                8.verticalSpace,
                Text.rich(
                  TextSpan(
                      text:
                          "Kami telah mengirimkan OTP 8 digit melalui SMS ke ",
                      children: [
                        WidgetSpan(
                          child: Text(
                            "+62 82140591331",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                        )
                      ]),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.sp, color: Colors.grey.shade400),
                ),
                48.verticalSpace,
                FilledTextField(
                    labelText: "Masukkan OTP", controller: controller),
                32.verticalSpace,
                resend
                    ? TextButton(
                        child: Text("Krim ulang",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500)),
                        onPressed: () {},
                      )
                    : Text.rich(TextSpan(
                        text: "Kirim ulang SMS dalam ",
                        children: [
                          WidgetSpan(
                              child: Countdown(
                            seconds: 30,
                            interval: const Duration(seconds: 1),
                            onFinished: () {
                              setState(() {
                                resend = true;
                              });
                            },
                            build: (context, time) {
                              return Text(
                                "${TimerUtils(time.toInt()).seconds} Detik",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500),
                              );
                            },
                          ))
                        ],
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500)))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                text: "Next",
                onPressed: () {
                  RegisterNavigation.navigateToSecurity(context);
                },
              ),
            )
          ],
        ));
  }
}
