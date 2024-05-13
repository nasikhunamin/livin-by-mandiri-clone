import 'package:flutter/material.dart';
import 'package:register/register.dart';
import 'package:register/src/screens/widgets/pin_widget.dart';
import 'package:register/src/screens/widgets/progress_scaffold_widget.dart';
import 'package:ui/ui.dart';

class DebitPinScreen extends StatelessWidget {
  const DebitPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgressScaffoldWidget(
        progress: 1.0,
        child: Column(
          children: [
            MyNetworkImage(
              url:
                  "https://www.bankmandiri.co.id/documents/20143/43982274/ag-landingpage-2.png/78c24bdb-c274-092b-a93d-3d88402ba631?t=1611125448234",
              width: 80.w,
              height: 60.h,
              fit: BoxFit.fitWidth,
            ),
            16.verticalSpace,
            Text(
              "PIN Kartu Debit",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            Text(
              "PIN kartu Debit dibutuhkan untuk autentikasi pengguna",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
            ),
            Expanded(child: PinWidget(onSubmitted: (val) {
              RegisterNavigation.navigateToSuccessfulRegister(context);
            })),
          ],
        ));
  }
}
