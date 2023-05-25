import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/authentication_view.dart';
import 'package:news_aggregator_ui/view/bookmarks_view.dart';
import 'package:news_aggregator_ui/view/content_view.dart';
import 'package:news_aggregator_ui/view/news_view.dart';
import 'package:news_aggregator_ui/view/registration_view.dart';

class RoutesGenerator {

  ///Provides routing between [AuthenticationView], [BookmarksView], [ContentView], [NewsView], [RegistrationView]
  ///Allows to pass [username] (and other parameters - if needed) between these views
  ///[AuthenticationView] and [RegistrationView] don't take any parameters
  ///[AuthenticationView] passes [username] as a parameter
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/news':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => NewsView(
              user: args,
            ),
          );
        }
        return _errorRoute();
      case '/bookmarks':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BookmarksView(
              user: args,
            ),
          );
        }
        return _errorRoute();
      case '/content':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ContentView(
              user: args[0],
              url: args[1],
            ),
          );
        }
        return _errorRoute();
      case '/authentication':
        return MaterialPageRoute(builder: (_) => const AuthenticationView());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationView());
      default:
        return _errorRoute();
    }
  }

  /// Provides error route
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