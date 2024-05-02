import 'package:flutter/material.dart';

class SecureWidget extends StatefulWidget {
  final Widget child;

  const SecureWidget({super.key, required this.child});

  @override
  State<SecureWidget> createState() => _SecureWidgetState();
}

class _SecureWidgetState extends State<SecureWidget>
    with WidgetsBindingObserver {
  bool _secure = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("mna -> state ${state.name} mounted $mounted");

    setState(() {
      print('mna -> call setstate');
      _secure = state == AppLifecycleState.paused;
    });

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    if (_secure) {
      return Container(
        color: Colors.red,
        height: double.infinity,
        width: double.infinity,
      );
    }

    return widget.child;
  }
}
