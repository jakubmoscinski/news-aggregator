import 'package:flutter/material.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Aggregator'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _provideTextField('Username', userNameController, false),
            _provideTextField('Password', passwordNameController, true),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushReplacementNamed('/news');
              },
              child: const Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _provideTextField(String label, TextEditingController controller, bool obscure) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: label),
      ),
    );
  }

}
