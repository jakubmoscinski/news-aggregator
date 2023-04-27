import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/authentication_view.dart';
import 'package:news_aggregator_ui/view/news_view.dart';

class RoutesGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/news':
        return MaterialPageRoute(builder: (_) => const NewsView());
      case '/authentication':
        return MaterialPageRoute(builder: (_) => const AuthenticationView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('Unexpected error has occurred. Please restart the app and contact support'),
          ),
        ),
      );
    });
  }

}