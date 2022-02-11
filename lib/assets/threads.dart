import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'post.dart';

class Threads extends StatefulWidget {
  const Threads({Key? key, this.subreddit, this.threads}) : super(key: key);

  final dynamic? subreddit;
  final dynamic? threads;

  @override
  _Body createState() => _Body();
}

class postSize {
  double widthSceen;
  double heightScreen;
  double heightPost;
  String subredditName;
  String postText;
  String selfText;
  bool isLiked;
  bool isDisliked;
  String score;
  String comments;
  String author;
  bool isImage;
  String url;
  bool isVideo;
  ChewieListItem video;

  postSize(
      {required this.widthSceen,
      required this.heightScreen,
      required this.heightPost,
      required this.subredditName,
      required this.postText,
      required this.selfText,
      required this.isLiked,
      required this.isDisliked,
      required this.score,
      required this.comments,
      required this.author,
      required this.isImage,
      required this.url,
      required this.isVideo,
      required this.video});
}

class _Body extends State<Threads> {
  @override
  Widget build(BuildContext Scaffold) {
    return Column(
      children: [
        for (var i = 0; i != widget.threads['data']['children'].length - 1; i++)
          Post(
            postsize: postSize(
                widthSceen: MediaQuery.of(context).size.width,
                heightScreen: MediaQuery.of(context).size.height,
                heightPost: 400,
                subredditName:
                    '${widget.threads!['data']['children'][i]['data']['subreddit_name_prefixed']}',
                postText:
                    '${widget.threads!['data']['children'][i]['data']['title']}',
                selfText:
                    '${widget.threads!['data']['children'][i]['data']['selftext']}',
                isLiked: '${widget.threads!['data']['children'][i]['data']['likes']}' ==
                        'true'
                    ? true
                    : false,
                isDisliked: '${widget.threads!['data']['children'][i]['data']['likes']}' ==
                        'false'
                    ? true
                    : false,
                score:
                    '${widget.threads!['data']['children'][i]['data']['score']}',
                comments:
                    '${widget.threads!['data']['children'][i]['data']['num_comments']}',
                author:
                    '${widget.threads!['data']['children'][i]['data']['author']}',
                isImage:
                    '${widget.threads!['data']['children'][i]['data']['post_hint']}' ==
                            'image'
                        ? true
                        : false,
                url: '${widget.threads!['data']['children'][i]['data']['url']}',
                isVideo:
                    '${widget.threads!['data']['children'][i]['data']['is_video']}' ==
                            'true'
                        ? true
                        : false,
                video:
                    '${widget.threads!['data']['children'][i]['data']['is_video']}' ==
                            'true'
                        ? ChewieListItem(
                            videoPlayerController:
                                VideoPlayerController.network(
                              '${widget.threads!['data']['children'][i]['data']['media']['reddit_video']['fallback_url']}',
                            ),
                            looping: false,
                          )
                        : ChewieListItem(
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://v.redd.it/b7tlohwb6jw71/DASH_480.mp4?source=fallback',
                            ),
                            looping: false,
                          )),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    required this.videoPlayerController,
    required this.looping,
    Key? key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
