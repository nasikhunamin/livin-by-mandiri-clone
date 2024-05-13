import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:register/register.dart';
import 'package:register/src/screens/widgets/pin_widget.dart';
import 'package:ui/ui.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        children: [
          Text(
            "Buat PIN baru",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          8.verticalSpace,
          Text(
            "Hindari PIN yang mudah ditebak, seperti 6 Angka berulang, beruntun, atau tanggal lahir Anda.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
          ),
          16.verticalSpace,
          Expanded(
            child: PinWidget(onSubmitted: (val) async {
              var result =
                  await RegisterNavigation.navigateToConfirmPin(context, val);
              print("mna -> $result");
              if (context.mounted) {
                Navigator.pop(context, result);
              }
            }),
          )
        ],
      ),
    );
  }
}
