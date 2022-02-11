import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'threads.dart';

class Post extends StatelessWidget {
  final postSize postsize;

  const Post({Key? key, required this.postsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const SizedBox(height: 40),
        Container(
          height: postsize.heightPost,
          width: postsize.widthSceen - 5,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(children: [
                Row(children: <Widget>[
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          width: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Image.asset('images/reddit.png')),
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(postsize.subredditName,
                              style: const TextStyle(fontSize: 12))),
                      Container(
                          margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text('Posted by ${postsize.author}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 7))),
                    ],
                  ),
                ]),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                    alignment: Alignment.topLeft,
                    height: postsize.heightPost - 65,
                    width: MediaQuery.of(context).size.width - 25,
                    child: Scrollbar(
                        child: SingleChildScrollView(
                            child: Text(
                      postsize.postText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )))),
                Center(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 90, 0, 20),
                  alignment: Alignment.center,
                  child: postsize.isImage == true
                      ? Image.network(postsize.url,
                          height: 230,
                          width: MediaQuery.of(context).size.width - 50,
                          fit: BoxFit.cover)
                      : postsize.selfText != ''
                          ? Scrollbar(
                              child: SingleChildScrollView(
                                  child: Text(
                              postsize.selfText,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )))
                          : postsize.isVideo == true
                              ? postsize.video
                              : InkWell(
                                  child: const Text('Link',
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.underline)),
                                  onTap: () => launch(postsize.url)),
                )),
                Row(
                  children: [
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                            onTap: () {
                              postsize.isLiked = true;
                            },
                            child: postsize.isLiked == true
                                ? const Icon(Icons.arrow_upward,
                                    color: Colors.green)
                                : const Icon(Icons.arrow_upward,
                                    color: Colors.grey)),
                      )
                    ]),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 2, 5),
                        alignment: Alignment.bottomLeft,
                        child: postsize.isLiked == true
                            ? Text('${int.parse(postsize.score) + 1}',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 10))
                            : postsize.isDisliked == true
                                ? Text('${int.parse(postsize.score) - 1}',
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10))
                                : Text(postsize.score,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 10))),
                    Row(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0, 0, postsize.widthSceen / 13, 0),
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                            onTap: () {
                              postsize.isDisliked = true;
                            },
                            child: postsize.isDisliked == true
                                ? const Icon(Icons.arrow_downward,
                                    color: Colors.red)
                                : const Icon(Icons.arrow_downward,
                                    color: Colors.grey)),
                      )
                    ]),
                    Row(children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.mode_comment_outlined,
                                  color: Colors.grey))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              0, 0, postsize.widthSceen / 19, 5),
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: () {},
                            child: Text('${postsize.comments} Commentaires',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 10)),
                          ))
                    ]),
                    Row(children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                  Icons.subdirectory_arrow_right_rounded,
                                  color: Colors.grey))),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {},
                            child: const Text('Partager',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10)),
                          ))
                    ]),
                  ],
                ),
              ])),
        )
      ]),
    );
  }
}
