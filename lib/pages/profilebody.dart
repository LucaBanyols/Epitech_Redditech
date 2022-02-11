import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../back/functions.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key, this.subreddit}) : super(key: key);

  final dynamic? subreddit;

  @override
  _Body createState() => _Body();
}

class _Body extends State<ProfileBody> {
  @override
  Widget build(BuildContext Scaffold) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
      color: Colors.blueGrey[800],
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black,
                        ),
                      ),
                      child: Image.network(
                        parseBaseUrl(
                          widget.subreddit!['subreddit']['banner_img']
                              .toString(),
                        ),
                        scale: 0.75,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        margin: const EdgeInsets.all(60),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: Colors.black,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              parseBaseUrl(
                                widget.subreddit!['subreddit']['icon_img']
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                  alignment: Alignment.center,
                  child: Text(
                    widget.subreddit!['name'].toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 20, 5, 10),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              widget.subreddit!['coins'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'Coins',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              widget.subreddit!['subreddit']['subscribers']
                                  .toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'Subscribers',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            alignment: Alignment.center,
                            child: Text(
                              widget.subreddit!['total_karma'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'Karma',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                  alignment: Alignment.center,
                  child: const Text(
                    'Description :',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.subreddit!['subreddit']['public_description']
                        .toString(),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
