import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../back/functions.dart';
import '../pages/homepage.dart';
import '../pages/hotpage.dart';
import '../pages/newspage.dart';
import '../pages/profilepage.dart';
import '../pages/toppage.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
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
  _SimpleDrawer createState() => _SimpleDrawer();
}

class _SimpleDrawer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 285,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      parseBaseUrl(widget.subreddit!['subreddit']['icon_img']
                          .toString()),
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      '${widget.subreddit!['subreddit']['display_name']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              '${widget.subreddit!['subreddit']['public_description']}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
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
            leading: const Icon(Icons.moving),
            title: const Text('Best'),
          ),
          ListTile(
            onTap: () {
              Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyHotPage(
                    subreddit: widget.subreddit,
                    best: widget.best,
                    hot: widget.hot,
                    news: widget.news,
                    top: widget.top,
                  ),
                ),
              );
            },
            leading: const Icon(Icons.local_fire_department),
            title: const Text('Hot'),
          ),
          ListTile(
            onTap: () {
              Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyNewsPage(
                    subreddit: widget.subreddit,
                    best: widget.best,
                    hot: widget.hot,
                    news: widget.news,
                    top: widget.top,
                  ),
                ),
              );
            },
            leading: const Icon(Icons.fiber_new_outlined),
            title: const Text('New'),
          ),
          ListTile(
            onTap: () {
              Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyTopPage(
                    subreddit: widget.subreddit,
                    best: widget.best,
                    hot: widget.hot,
                    news: widget.news,
                    top: widget.top,
                  ),
                ),
              );
            },
            leading: const Icon(Icons.looks_one_rounded),
            title: const Text('Top'),
          ),
          ListTile(
            onTap: () {
              Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyProfilePage(
                    subreddit: widget.subreddit,
                    best: widget.best,
                    hot: widget.hot,
                    news: widget.news,
                    top: widget.top,
                  ),
                ),
              );
            },
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
