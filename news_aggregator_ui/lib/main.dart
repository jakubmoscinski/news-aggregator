import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/login_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'News Aggregator',
    home: const MyHomePage(),
    theme: ThemeData(
      primaryColor: Colors.grey,
      textTheme: const TextTheme(
        headline6: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
        button: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30.0),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
      ),
    ),
  ));
}
