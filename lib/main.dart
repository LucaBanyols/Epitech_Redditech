import 'package:flutter/material.dart';
import 'package:redditech/pages/homepage.dart';

import 'pages/homepage.dart';
import 'pages/hotpage.dart';
import 'pages/newspage.dart';
import 'pages/profilepage.dart';
import 'pages/toppage.dart';
import 'webview.dart';

void main() async {
// CODE FRONT~
  runApp(MyApp());
}

// ignore: public_member_api_docs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REDDITECH',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300], fontFamily: 'Verdana'),
      routes: {
        '/': (BuildContext context) => MyWebView(context: context),
        '/home': (BuildContext context) => MyHomePage(),
        '/profile': (BuildContext context) => MyProfilePage(),
        '/hot': (BuildContext context) => MyHotPage(),
        '/news': (BuildContext context) => MyNewsPage(),
        '/top': (BuildContext context) => MyTopPage(),
      },
    );
  }
}
