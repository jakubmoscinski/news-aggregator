import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/controller/controller.dart';

class FavoriteNewsService with ChangeNotifier {
  static const _timeout = 8;
  final Controller _controller;

  bool _isFavorite = false;

  FavoriteNewsService() : _controller = const Controller(baseUrl: 'http://10.0.2.2:8080/news-aggregator/member');

  ///Performs asynchronous calls to News Aggregator API
  ///Updates user of [username] by assigning article of [articleId] as a favorite/bookmarked one
  Future<void> addToFavorites(String username, int articleId) async {
    final clientResponse = await _controller.getData(urlPart: '/add-favorite/$username/$articleId', timeout: _timeout);

    if (!clientResponse.isSuccess) {
      debugPrint(clientResponse.errorMessage);
    }
  }

  ///Performs asynchronous calls to News Aggregator API
  ///Updates [isFavorite] flag and notifies listeners about it
  ///Checks if user of a given [username] bookmarked article of [articleId]
  Future<void> checkIfFavorite(String username, int articleId) async {
    final clientResponse = await _controller.getData(urlPart: '/is-favorite/$username/$articleId', timeout: _timeout);

   _isFavorite = false;

    if (clientResponse.isSuccess) {
      _isFavorite = clientResponse.response;
    } else {
      debugPrint(clientResponse.errorMessage);
    }

    notifyListeners();
  }

  bool get isFavorite => _isFavorite;

}