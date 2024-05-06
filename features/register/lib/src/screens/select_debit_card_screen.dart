import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:register/src/screens/widgets/debit_card_slider.dart';
import 'package:ui/ui.dart';

class SelectDebitCardScreen extends StatefulWidget {
  const SelectDebitCardScreen({super.key});

  @override
  State<SelectDebitCardScreen> createState() => _SelectDebitCardScreenState();
}

class _SelectDebitCardScreenState extends State<SelectDebitCardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithScrollWidget(
      child: Column(
        children: [
          Text(
            "Select Physical Debit Card",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          36.verticalSpace,
          DebitCardSlider(
              selectedIndex: _selectedIndex,
              onChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
          16.verticalSpace,
          DotsIndicator(
            dotsCount: 4,
            position: _selectedIndex,
            decorator: DotsDecorator(
                activeColor: Colors.blue,
                color: Colors.grey,
                spacing: const EdgeInsets.all(3).r),
          ),
          16.verticalSpace,
          Text(
            "Visa Gold ${_selectedIndex + 1}",
            style: TextStyle(
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          36.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RoundedButton(
              text: "Next",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
