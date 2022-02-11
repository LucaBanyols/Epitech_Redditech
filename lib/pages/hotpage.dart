import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../assets/appbar.dart';
import '../assets/drawer.dart';
import '../assets/threads.dart';

class MyHotPage extends StatefulWidget {
  MyHotPage({
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
  _SimpleHotPage createState() => _SimpleHotPage();
}

class _SimpleHotPage extends State<MyHotPage> {
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
            child: Threads(
          subreddit: widget.subreddit,
          threads: widget.hot,
        )),
      );
}
