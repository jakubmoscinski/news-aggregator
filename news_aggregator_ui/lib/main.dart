import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'News Agreggator',
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

Color myGreen = Color.fromARGB(255, 129, 197, 129);

class _LoginPageState extends State<LoginPage> {
  // Initialize variables to store email and password
  String _email = '';
  String _password = '';

  // Method to handle login button press
  void _handleLogin() {
    // Check if email and password are not empty
    if (_email.isNotEmpty && _password.isNotEmpty) {
      // Navigate to main page of the app
      Navigator.pushNamed(context, '/main');
    } else {
      // Show error message if email or password are empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter your email and password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      appBar: AppBar(
        backgroundColor: myGreen,
        title: const Text('News Agreggator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email input field
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'example@gmail.com',
              ),
              onChanged: (value) => setState(() => _email = value),
            ),
            const SizedBox(height: 16.0),

            // Password input field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '***************',
              ),
              onChanged: (value) => setState(() => _password = value),
            ),
            const SizedBox(height: 32.0),

            // Login button
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(backgroundColor: myGreen),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
