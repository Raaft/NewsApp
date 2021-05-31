import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  final String url;
   WebViewScreen( this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:50,right: 3,left: 3,bottom: 5),
      child: Scaffold(
        body:WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
