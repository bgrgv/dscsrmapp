import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class KahootWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      resizeToAvoidBottomInset: true,
      url: "https://kahoot.it",
      withZoom: false,
      withJavascript: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: Center(
          child: Image.asset('assets/dsc.png'),
        ),
      ),
    );
  }
}
