import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'back/dio.dart';

class MyWebView extends StatelessWidget {
  MyWebView({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl:
          'https://www.reddit.com/api/v1/authorize.compact?client_id=$CLIENT_ID&response_type=$RESPONSE_TYPE&state=$STATE&redirect_uri=$REDIRECT_URI&duration=$DURATION&scope=$SCOPE',
      onPageStarted: (String urlToCheck) {
        if (urlToCheck.startsWith(REDIRECT_URI)) {
          getAccessToken(urlToCheck, context);
        }
      },
    );
  }
}
