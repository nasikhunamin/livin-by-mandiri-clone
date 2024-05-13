import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class PinWidget extends StatefulWidget {
  const PinWidget({super.key, required this.onSubmitted});

  final Function(String) onSubmitted;

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  String enteredPin = '';

  /// this widget will be use for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16).r,
      child: TextButton(
        onPressed: () async {
          setState(() {
            if (enteredPin.length < 6) {
              enteredPin += number.toString();
            }
          });

          if (enteredPin.length == 6) {
            Future.delayed(const Duration(milliseconds: 500), () {
              widget.onSubmitted(enteredPin);
            });
          }
        },
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 32.sp,
            fontFamily: FontFamily.poppins,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        48.verticalSpace,

        /// pin code area
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) {
              return Container(
                margin: const EdgeInsets.all(6.0).r,
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < enteredPin.length
                      ? Colors.blue
                      : Colors.grey.shade100,
                ),
              );
            },
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// digits
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => numButton(1 + 3 * i + index),
                    ).toList(),
                  ),
                ),

              /// 0 digit with back remove
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextButton(onPressed: null, child: SizedBox()),
                    numButton(0),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            if (enteredPin.isNotEmpty) {
                              enteredPin = enteredPin.substring(
                                  0, enteredPin.length - 1);
                            }
                          },
                        );
                      },
                      child: const Icon(
                        Icons.backspace,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              16.verticalSpace,
            ],
          ),
        )
      ],
    );
  }
}
