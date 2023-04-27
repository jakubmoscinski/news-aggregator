import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/authentication_view.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Aggregator',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(2))),
          )),
      home: const AuthenticationView(),
    );
  }
}
