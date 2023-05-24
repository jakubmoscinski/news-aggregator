import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/controller/controller.dart';

class RegistrationService with ChangeNotifier {
  static const _timeout = 8;
  final Controller _controller;

  RegistrationService() : _controller = const Controller(baseUrl: 'http://10.0.2.2:8080/news-aggregator/member');

  Future<void> createUser(String firstName, String lastName, String username, String password) async {
    await _controller.getData(urlPart: '/new-user/$firstName/$lastName/$username/$password', timeout: _timeout);
  }

}