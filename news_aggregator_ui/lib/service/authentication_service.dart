import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/controller/controller.dart';

class AuthenticationService with ChangeNotifier {
  static const _timeout = 8;
  final Controller _controller;

  bool _isAuthenticated = false;

  AuthenticationService() : _controller = const Controller(baseUrl: 'http://10.0.2.2:8080/news-aggregator/member');

  ///Performs asynchronous calls to News Aggregator API
  ///Allows to authenticate - check if a user of a given [username] and [password] is a valid user
  ///Notifies listeners - [isAuthenticated] updates
  Future<void> authenticate(String username, String password) async {
    final clientResponse = await _controller.getData(urlPart: '/authenticate/$username/$password', timeout: _timeout);

    _isAuthenticated = false;

    if (clientResponse.isSuccess) {
      _isAuthenticated = clientResponse.response;
    } else {
      debugPrint(clientResponse.errorMessage);
    }

    notifyListeners();
  }

  bool get isAuthenticated => _isAuthenticated;
}