import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._shareInstance();

  static final LoadingDialog _shared = LoadingDialog._shareInstance();

  factory LoadingDialog.instance() => _shared;

  BuildContext? _dialogContext;

  show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        _dialogContext = context;
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  void hide() {
    if (_dialogContext != null && _dialogContext!.mounted) {
      Navigator.pop(_dialogContext!);
    }
  }
}
