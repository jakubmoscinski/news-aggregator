import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/router/routes.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  final _appRouter = RoutesGenerator();

  Application({Key? key}) : super(key: key);

  ///Provides common styling
  ///Defines start route
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRouter.generateRoute,
      initialRoute: '/authentication',
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
    );
  }
}
