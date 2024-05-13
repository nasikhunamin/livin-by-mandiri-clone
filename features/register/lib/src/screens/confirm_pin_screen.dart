import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/src/screens/widgets/pin_widget.dart';
import 'package:ui/ui.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key});

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        children: [
          Text(
            "Konfirmasi PIN",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          16.verticalSpace,
          Expanded(
            child: PinWidget(onSubmitted: (val) {
              Navigator.pop(context, val);
            }),
          )
        ],
      ),
    );
  }
}
