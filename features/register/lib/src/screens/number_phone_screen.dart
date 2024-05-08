import 'package:flutter/material.dart';
import 'package:register/register.dart';
import 'package:register/src/screens/widgets/progress_scaffold_widget.dart';
import 'package:ui/ui.dart';

final scaffoldState = GlobalKey<ScaffoldState>();

class NumberPhoneScreen extends StatefulWidget {
  const NumberPhoneScreen({super.key});

  @override
  State<NumberPhoneScreen> createState() => _NumberPhoneScreenState();
}

class _NumberPhoneScreenState extends State<NumberPhoneScreen> {
  final TextEditingController phoneController = TextEditingController(text: '');

  String code = "+62";

  @override
  Widget build(BuildContext context) {
    return ProgressScaffoldWidget(
        scaffoldState: scaffoldState,
        progress: 0.4,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Text(
                  "Input Your Handphone Number",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                8.verticalSpace,
                Text(
                  "We'll send you OTP via SMS to verify your account.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var result = await RegisterNavigation
                            .navigateToSearchCountryCode(context);
                        if (result != null && result.isNotEmpty) {
                          setState(() {
                            code = result;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8)
                            .r,
                        color: Colors.grey.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Country code",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const MyNetworkImage(
                                  url:
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/1280px-Flag_of_Indonesia.svg.png",
                                  height: 20,
                                  width: 24,
                                ),
                                8.horizontalSpace,
                                Text(
                                  code,
                                  textAlign: TextAlign.start,
                                ),
                                8.horizontalSpace,
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey.shade700,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Flexible(
                      child: FilledTextField(
                          keyboardType: TextInputType.number,
                          labelText: "Handphone Number",
                          controller: phoneController),
                    )
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                text: "Next",
                onPressed: () {
                  showNotifBottomSheet();
                },
              ),
            )
          ],
        ));
  }

  void showNotifBottomSheet() {
    showModalBottomSheet(
      context: scaffoldState.currentContext!,
      backgroundColor: Colors.white,
      elevation: 32,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16)
                          .r,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
              Container(
                color: Colors.amber.shade50,
                width: double.infinity,
                padding: const EdgeInsets.all(12).r,
                margin:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 24).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Penting!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.amber.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    8.verticalSpace,
                    Text(
                      "Cek SMS dari BANK MANDIRI berisi 8 digit \nkode OTP.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.grey.shade700),
                    ),
                    4.verticalSpace,
                    ListTile(
                      minLeadingWidth: 32,
                      leading: const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 32,
                      ),
                      title: Text(
                        "Pastikan nomor aktif dan berada di jangkauan Anda.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.grey.shade700),
                        maxLines: 2,
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 32,
                      leading: const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 32,
                      ),
                      title: Text(
                        "Jaga kerahasiaan OTP dan jangan bagikan ke orang lain termasuk staf bank.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.grey.shade700),
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: RoundedButton(
                  infinity: true,
                  text: "Kirim SMS",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
