import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../assets/appbar.dart';
import '../assets/drawer.dart';
import 'profilebody.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({
    Key? key,
    this.subreddit,
    this.best,
    this.hot,
    this.news,
    this.top,
  }) : super(key: key);

  final dynamic? subreddit;
  final dynamic? best;
  final dynamic? hot;
  final dynamic? news;
  final dynamic? top;

  @override
  _SimpleProfile createState() => _SimpleProfile();
}

class _SimpleProfile extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: MyDrawer(
          subreddit: widget.subreddit,
          best: widget.best,
          hot: widget.hot,
          news: widget.news,
          top: widget.top,
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: MyAppbar(
            subreddit: widget.subreddit,
            best: widget.best,
            hot: widget.hot,
            news: widget.news,
            top: widget.top,
          ),
        ),
        body: SingleChildScrollView(
            child: ProfileBody(subreddit: widget.subreddit)),
      );
}
