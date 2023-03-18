import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/login_view.dart';

//todo there is some better way to od imports

void main() {
  runApp(MaterialApp(
    title: 'News Aggregator',
    home: MyHomePage(),
    theme: ThemeData(
      primaryColor: Colors.blueGrey,
      accentColor: Colors.blueAccent,
      // Define more styles here as per your requirement
      // For example:
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
        button: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        labelStyle: TextStyle(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
        ),
      ),
    ),
  ));
}