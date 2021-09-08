import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _key = UniqueKey();
  bool _isLoadingPage = true;

  Completer<WebViewController> _completer = Completer<WebViewController>();
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              new WebView(
                key: _key,
                initialUrl: "http://www.gemspropertyservices.com/",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (webViewCreate) {
                  _completer.future.then((value) => controller = value);
                  _completer.complete(webViewCreate);
                },
                onPageFinished: (finish) {
                  setState(() {
                    _isLoadingPage = false;
                  });
                },
                navigationDelegate: (NavigationRequest request) {
                  return NavigationDecision.navigate;

                },
                onPageStarted: (String url) {
                 },
              ),
              _isLoadingPage
                  ? Container(
                      alignment: FractionalOffset.center,
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return null;
    } else {
      exit(0);
      return Future.value(false);
    }
  }
}
