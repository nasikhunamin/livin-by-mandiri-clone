import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatefulWidget {
  final Function()? onLoading;
  final Function()? onPageFinished;
  final Function(String)? onLoadUrl;
  final String url;

  const WebWidget(
      {super.key,
      required this.url,
      this.onLoading,
      this.onLoadUrl,
      this.onPageFinished});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  late WebViewController controller;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        if (widget.onLoading != null) widget.onLoading!();
      }, onPageFinished: (url) {
        setState(() {
          _isLoading = false;
        });
        if (widget.onPageFinished != null) widget.onPageFinished!();
      }, onNavigationRequest: (navigation) {
        if (widget.onLoadUrl != null) {
          widget.onLoadUrl!(navigation.url);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }))
      ..setBackgroundColor(Colors.white)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && widget.onLoading == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return WebViewWidget(controller: controller);
  }
}
