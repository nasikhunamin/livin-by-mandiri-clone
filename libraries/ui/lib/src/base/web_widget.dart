//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';

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
  //late WebViewController controller;

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

    controller?.reload();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return WebViewWidget(controller: controller);

    return InAppWebView(
      key: const ValueKey("web_widget"),
      initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
      //initialSettings: settings,
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: false,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          )),
      onLoadStart: (controller, url) {
        if (widget.onLoading != null) widget.onLoading!();
      },
      onLoadStop: (controller, url) {
        if (widget.onPageFinished != null) widget.onPageFinished!();
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        if (widget.onLoadUrl != null) {
          widget.onLoadUrl!(navigationAction.request.url.toString());

          return NavigationActionPolicy.CANCEL;
        }

        return NavigationActionPolicy.ALLOW;
      },
      onProgressChanged: (controller, progress) {
        if (widget.onLoading != null && progress < 100) widget.onLoading!();
        if (widget.onPageFinished != null && progress >= 100) {
          widget.onPageFinished!();
        }
      },
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
    );
  }
}
