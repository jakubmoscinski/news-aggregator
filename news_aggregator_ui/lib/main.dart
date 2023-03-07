import 'package:flutter/material.dart';

void main() {
  runApp(const NewsAggregator());
}

class NewsAggregator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: mainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}