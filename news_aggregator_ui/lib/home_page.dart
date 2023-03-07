import 'package:flutter/material.dart';

Color myGreen = Color.fromARGB(255, 129, 197, 129);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myGreen,
        title: Text('Welcome!'),
      ),
      body: Center(
        child: Text('This is the login page'),
      ),
    );
  }
}
