import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/service/authentication_service.dart';
import 'package:news_aggregator_ui/view/news_view.dart';
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
                      ButtonBar(children: [
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<AuthenticationService>().authenticate(userNameController.text, passwordController.text);

                            if (value.isAuthenticated) {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>
                                  NewsView(user: userNameController.text)
                                )
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildWarningPopupDialog(context),
                              );
                            }
                          },
                          child: const Text('Log in'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                              Navigator.of(context).pushReplacementNamed('/registration');
                          },
                          child: const Text('Sign in'),
                        ),
                      ],),
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

  Widget _buildWarningPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(color: Colors.redAccent),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Please enter correct username and password"),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        },
          child: const Text('Close'),
        ),
      ],
    );
  }

}
