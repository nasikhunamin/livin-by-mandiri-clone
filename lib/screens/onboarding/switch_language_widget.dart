import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SwitchLanguageWidget extends StatefulWidget {
  const SwitchLanguageWidget({super.key});

  @override
  State<SwitchLanguageWidget> createState() => _SwitchLanguageWidgetState();
}

class _SwitchLanguageWidgetState extends State<SwitchLanguageWidget> {
  String _selectedLanguage = "en";

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(_selectedLanguage),
      padding: const EdgeInsets.all(2).r,
      decoration: BoxDecoration(
          color: _selectedLanguage == "id" ? Colors.blue : Colors.blue[900],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerLanguage(
              isSelected: _selectedLanguage == "en",
              text: "en",
              onPressed: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              }),
          2.horizontalSpace,
          ContainerLanguage(
              isSelected: _selectedLanguage == "id",
              text: "id",
              onPressed: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              }),
        ],
      ),
    );
  }
}

class ContainerLanguage extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function(String) onPressed;

  const ContainerLanguage(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(text);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2).r,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color:
                  isSelected ? Colors.blue[900] : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}
