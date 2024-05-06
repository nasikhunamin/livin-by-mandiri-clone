//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatefulWidget {
  final Function()? onLoading;
  final Function(double)? onPageFinished;
  final Function(String)? onLoadUrl;
  final bool disableVerticalScroll, disableHorizontalScroll;
  final String url;

  const WebWidget(
      {super.key,
      required this.url,
      this.onLoading,
      this.onLoadUrl,
      this.onPageFinished,
      this.disableHorizontalScroll = false,
      this.disableVerticalScroll = false});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  //late WebViewController controller;

  double loadingPercentage = 0.0;

  InAppWebViewController? controller;

  // InAppWebViewSettings settings = InAppWebViewSettings(
  //     isInspectable: kDebugMode,
  //     mediaPlaybackRequiresUserGesture: false,
  //     allowsInlineMediaPlayback: true,
  //     iframeAllow: "camera; microphone",
  //     iframeAllowFullscreen: true);

  @override
  void initState() {
    super.initState();
    // controller = WebViewController()
    //   ..loadRequest(Uri.parse(widget.url))
    //   ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
    //     if (widget.onLoading != null) widget.onLoading!();
    //   }, onPageFinished: (url) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     if (widget.onPageFinished != null) widget.onPageFinished!();
    //   }, onNavigationRequest: (navigation) {
    //     if (widget.onLoadUrl != null) {
    //       widget.onLoadUrl!(navigation.url);
    //       return NavigationDecision.prevent;
    //     }
    //     return NavigationDecision.navigate;
    //   }))
    //   ..setBackgroundColor(Colors.white)
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return WebViewWidget(controller: controller);

    return Stack(
      children: [
        InAppWebView(
          key: const ValueKey("web_widget"),
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          //initialSettings: settings,
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: false,
                  cacheEnabled: true,
                  transparentBackground: true,
                  disableHorizontalScroll: widget.disableHorizontalScroll,
                  disableVerticalScroll: widget.disableVerticalScroll),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
              )),
          onLoadStart: (controller, url) {
            if (widget.onLoading != null) widget.onLoading!();
            setState(() {
              loadingPercentage = 0.0;
            });
          },
          onLoadStop: (controller, url) async {
            if (widget.onPageFinished != null) {
              num? newHeight = await controller.evaluateJavascript(
                  source: "document.documentElement.scrollHeight;");
              widget.onPageFinished!(newHeight?.toDouble() ?? 0.0);
            }

            setState(() {
              loadingPercentage = 100;
            });
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            if (widget.onLoadUrl != null) {
              widget.onLoadUrl!(navigationAction.request.url.toString());

              return NavigationActionPolicy.CANCEL;
            }

            return NavigationActionPolicy.ALLOW;
          },
          onProgressChanged: (controller, progress) async {
            if (widget.onLoading != null && progress < 100) widget.onLoading!();
            if (widget.onPageFinished != null && progress >= 100) {
              num? newHeight = await controller.evaluateJavascript(
                  source: "document.documentElement.scrollHeight;");
              widget.onPageFinished!(newHeight?.toDouble() ?? 0.0);
            }

            setState(() {
              loadingPercentage = progress.toDouble();
            });
          },
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
