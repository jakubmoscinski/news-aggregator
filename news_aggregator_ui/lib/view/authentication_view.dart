import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/service/authentication_service.dart';
import 'package:provider/provider.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Aggregator'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ChangeNotifierProvider(
            create: (_) => AuthenticationService(),
            builder: (context, child) {
              return Consumer<AuthenticationService>(builder: (context, value, child) {
                // context.read<AuthenticationService>().fetchData();

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      _provideTextField('Username', userNameController, false),
                      _provideTextField('Password', passwordController, true),
                      ElevatedButton(
                        onPressed: () async {
                          context.read<AuthenticationService>().authenticate(userNameController.text, passwordController.text);

                          if (value.isAuthenticated) {
                            Navigator.of(context).pushReplacementNamed('/news');
                          } //todo when else condition
                        },
                        child: const Text('Log in'),
                      ),
                    ],
                  ),
                );
              });
            }),
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
