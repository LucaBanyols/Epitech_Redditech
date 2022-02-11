import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../pages/homepage.dart';

class MyAppbar extends StatefulWidget {
  MyAppbar({
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
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('images/reddit.png', fit: BoxFit.contain),
          iconSize: 30,
          onPressed: () {
            Navigator.push<Map<String, dynamic>>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage(
                  subreddit: widget.subreddit,
                  best: widget.best,
                  hot: widget.hot,
                  news: widget.news,
                  top: widget.top,
                ),
              ),
            );
          },
        ),
        title: Container(
          constraints: const BoxConstraints(
              maxWidth: 800, minWidth: 100, maxHeight: 80, minHeight: 10),
          color: Colors.grey[100],
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher dans Redditech',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 16, 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(90)),
              color: const Color(0x00000000),
              border: Border.all(
                color: const Color(0x00000000),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 30,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      );
}
