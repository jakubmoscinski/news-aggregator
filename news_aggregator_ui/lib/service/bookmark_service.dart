import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/controller/controller.dart';
import 'package:news_aggregator_ui/model/article_model.dart';

class BookmarkService with ChangeNotifier {
  static const _timeout = 8;
  final Controller _controller;

  final List<ArticleModel> _articles = [];

  BookmarkService() : _controller = const Controller(baseUrl: 'http://10.0.2.2:8080/news-aggregator/member');

  ///Performs asynchronous calls to News Aggregator API
  ///Allows to access all bookmarked articles of a user of [username]
  ///Notifies listeners - [_articles] updates
  Future<void> fetchData(String username) async {
    final clientResponse = await _controller.getData(urlPart: '/bookmarks/$username', timeout: _timeout);

    _articles.clear();

    if (clientResponse.isSuccess) {
      final List<ArticleModel> articles = [];

      List<dynamic> responseList = clientResponse.response;
      for (var response in responseList) {
        final _article = ArticleModel(
          id: response['id'],
          author: response['author'],
          source: response['source'],
          title: response['title'],
          url: response['url'],
        );

        articles.add(_article);
      }

      _articles.addAll(articles);
    } else {
      debugPrint(clientResponse.errorMessage);
    }

    notifyListeners();
  }

  List<ArticleModel> get articles => _articles;

}