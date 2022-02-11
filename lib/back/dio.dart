import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:redditech/pages/homepage.dart';

final CLIENT_ID = 'kzUgXXeVjVKLVmvixup15Q';
final RESPONSE_TYPE = 'code';
final STATE = 'Afba821JjfzdD93Jd4';
final REDIRECT_URI = 'http://readytech';
final DURATION = 'permanent';
final SCOPE = '*';
var CODE = 'notfound';
var ACCESS_TOKEN = '';

void getAccessToken(String urlToCheck, BuildContext context) async {
  // print('==============> Page started loading: $urlToCheck');
  final Uri url = Uri.parse(urlToCheck);
  final String encodedClientId = base64.encode(utf8.encode('$CLIENT_ID:'));
  // print('==============> encoded = $encodedClientId');

  url.queryParameters.forEach(
    (String k, String v) {
      // print('==============> $k = $v');
      if (k == 'code') {
        CODE = v;
      } else
        return;
    },
  );
  // print('==============> 11111');
  final Dio dio = Dio();
  dio.options.headers['Authorization'] = 'Basic $encodedClientId';
  dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
  // print('==============> 22222');
  final Response<Map<String, dynamic>> response = await dio.post<
          Map<String, dynamic>>('https://www.reddit.com/api/v1/access_token',
      data:
          'grant_type=authorization_code&code=$CODE&redirect_uri=$REDIRECT_URI');
  // print('==============> 33333');
  // print(response.data);
  getOauthData(response.data, context);
}

void getOauthData(dynamic data, BuildContext context) async {
  // print(data['access_token']);
  // print(data['token_type']);
  // print(data['expires_in']);
  // print(data['refresh_token']);
  // print(data['scope']);

  final Dio dio = Dio();
  dio.options.headers['Authorization'] = 'bearer ${data['access_token']}';
  dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
  final dynamic subreddit = await dio.get<Map<String, dynamic>>(
    'https://oauth.reddit.com/api/v1/me',
  );
  // print('subreddit =============>');
  // print(subreddit.data);
  final dynamic best = await dio.get<Map<String, dynamic>>(
    'https://oauth.reddit.com/best',
  );
  // print('best =============>');
  // print(best.data);
  final dynamic hot = await dio.get<Map<String, dynamic>>(
    'https://oauth.reddit.com/hot',
  );
  // print('hot =============>');
  // print(hot.data);
  final dynamic news = await dio.get<Map<String, dynamic>>(
    'https://oauth.reddit.com/new',
  );
  // print('news =============>');
  // print(news.data);
  final dynamic top = await dio.get<Map<String, dynamic>>(
    'https://oauth.reddit.com/top',
  );
  // print('top =============>');
  // print(top.data);
  Navigator.push<Map<String, dynamic>>(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => MyHomePage(
        subreddit: subreddit.data,
        best: best.data,
        hot: hot.data,
        news: news.data,
        top: top.data,
      ),
    ),
  );
}
