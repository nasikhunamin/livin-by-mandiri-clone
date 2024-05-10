import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController confirmController = TextEditingController(text: "");

  bool visibleValidator = false;

  bool minLength = false;
  bool optionA = false;
  bool optionB = false;
  bool optionC = false;

  void onChangedPassword() {
    setState(() {
      var text = passwordController.text;

      optionA = text.length >= 2;
      optionB = text.length >= 4;
      optionC = text.length >= 6;
      minLength = text.length >= 8;
    });
  }

  bool doneValidator() {
    return minLength && optionA && optionB && optionC;
  }

  @override
  void initState() {
    passwordController.addListener(onChangedPassword);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.removeListener(onChangedPassword);
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Buat password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Text(
                "Pastikan passwword sesuai kriteria keamanan dan belum pernah digunakan di aplikasi ini",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade400),
              ),
              16.verticalSpace,
              PasswordTextField(
                labelText: "Password",
                controller: passwordController,
                onFocusChange: (focus) {
                  setState(() {
                    visibleValidator = focus;
                  });
                },
              ),
              16.verticalSpace,
              PasswordTextField(
                labelText: "Konfirmasi password",
                controller: confirmController,
              )
            ],
          ),
        ),
        Visibility(
          visible: visibleValidator && !doneValidator(),
          child: Positioned(
            top: 160.h,
            left: 16.w,
            right: 16.w,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                color: Colors.white,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ValidatorPassword(
                    title: "Minimal 8 Karakter",
                    isChecked: minLength,
                  ),
                  ValidatorPassword(title: "Huruf besar", isChecked: optionA),
                  ValidatorPassword(title: "Huruf kecil", isChecked: optionB),
                  ValidatorPassword(title: "Angka", isChecked: optionC),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16).r,
            child: RoundedButton(
              text: "Next",
              onPressed: () {
                context.pop(passwordController.text);
              },
            ),
          ),
        )
      ],
    ));
  }
}

class ValidatorPassword extends StatelessWidget {
  final String title;
  final bool isChecked;

  const ValidatorPassword(
      {super.key, required this.title, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      minLeadingWidth: 0,
      dense: false,
      trailing: !isChecked
          ? const Icon(Icons.circle_outlined)
          : const Icon(
              Icons.check,
              color: Colors.green,
            ),
    );
  }
}
