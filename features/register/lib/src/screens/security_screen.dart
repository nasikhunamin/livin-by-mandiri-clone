import 'package:flutter/material.dart';
import 'package:register/register.dart';
import 'package:register/src/screens/widgets/progress_scaffold_widget.dart';
import 'package:ui/ui.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool finishedPassword = false;
  bool finsihedPin = false;

  @override
  Widget build(BuildContext context) {
    return ProgressScaffoldWidget(
      progress: 0.8,
      child: Stack(
        children: [
          ListView(
            children: [
              const Icon(
                Icons.security_rounded,
                color: Colors.blue,
              ),
              16.verticalSpace,
              Text(
                "Perkuat keamanan Akun",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Text(
                "Buat password dan PIN untuk keamanan ekstra akun anda di aplikasi ini.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade400),
              ),
              16.verticalSpace,
              Visibility(
                visible: finishedPassword,
                child: const SecurityDoneContainer(
                    title: "Password berhasil dibuat",
                    description: "Ganti Password"),
              ),
              8.verticalSpace,
              Visibility(
                visible: finsihedPin,
                child: const SecurityDoneContainer(
                    title: "PIN berhasil dibuat", description: "Ganti PIN"),
              ),
              Visibility(
                visible: !finishedPassword,
                child: SecurityContainer(
                  isActive: true,
                  title: "Password",
                  description:
                      "Password digunakan untuk login ke aplikasi Livin",
                  btnText: "Buat Password",
                  icon:
                      "https://cdn1.iconfinder.com/data/icons/mobile-device/512/key-password-pin-code-blue-round-512.png",
                  onFinsih: (value) {
                    setState(() {
                      finishedPassword = true;
                    });
                  },
                ),
              ),
              8.verticalSpace,
              Visibility(
                visible: !finsihedPin,
                child: SecurityContainer(
                  isActive: finishedPassword,
                  title: "PIN",
                  type: "pin",
                  description:
                      "Pin untuk otorisasi transaksi dan pengaturan di aplikasi ini.",
                  btnText: "Buat PIN",
                  icon:
                      "https://cdn-icons-png.freepik.com/512/7878/7878595.png",
                  onFinsih: (value) {
                    setState(() {
                      finsihedPin = true;
                    });
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: finishedPassword & finsihedPin,
              child: RoundedButton(
                text: "Next",
                onPressed: () {
                  RegisterNavigation.navigateToDebitPin(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SecurityContainer extends StatelessWidget {
  const SecurityContainer(
      {super.key,
      required this.isActive,
      required this.title,
      required this.description,
      required this.btnText,
      required this.icon,
      required this.onFinsih,
      this.type = "password"});

  final bool isActive;
  final String title, description, icon, type, btnText;
  final Function(String)? onFinsih;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: isActive ? Colors.grey.shade200 : Colors.grey.shade100,
      ),
      padding: const EdgeInsets.all(16).r,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    8.verticalSpace,
                    Text(
                      description,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    )
                  ],
                )),
                MyNetworkImage(
                  url: icon,
                  width: 48,
                  height: 48,
                )
              ],
            ),
            16.verticalSpace,
            RoundedButton(
              text: btnText,
              onPressed: isActive
                  ? () async {
                      if (type == "password") {
                        String? pass =
                            await RegisterNavigation.navigateToPassword(
                                context);
                        if (pass != null &&
                            pass.isNotEmpty &&
                            onFinsih != null) {
                          onFinsih!(pass);
                        }
                      } else {
                        String? pin =
                            await RegisterNavigation.navigateToPin(context);

                        if (pin != null && pin.isNotEmpty && onFinsih != null) {
                          onFinsih!(pin);
                        }
                      }
                    }
                  : null,
            )
          ]),
    );
  }
}

class SecurityDoneContainer extends StatelessWidget {
  const SecurityDoneContainer(
      {super.key,
      required this.title,
      required this.description,
      this.type = "password"});

  final String title, description, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                8.verticalSpace,
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                )
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 14,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
