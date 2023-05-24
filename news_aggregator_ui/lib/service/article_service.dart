import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/controller/controller.dart';
import 'package:news_aggregator_ui/model/article_model.dart';

class ArticleService with ChangeNotifier {
  static const _timeout = 8;
  final Controller _controller;

  final List<ArticleModel> _articles = [];

  ArticleService() : _controller = const Controller(baseUrl: 'http://10.0.2.2:8080/news-aggregator/article');

  Future<void> fetchData() async {
    final clientResponse = await _controller.getData(urlPart: '/list', timeout: _timeout);

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
          // day: model['publishedAt'],
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