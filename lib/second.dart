import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new WebView(
        initialUrl: 'https://www.ishanchhabra.com/sample-reg.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
