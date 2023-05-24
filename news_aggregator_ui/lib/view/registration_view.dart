import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/service/authentication_service.dart';
import 'package:news_aggregator_ui/service/registration_service.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final service = RegistrationService();

    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Please fill up your details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      _provideTextField('First name', firstNameController, false),
                      _provideTextField('Last name', lastNameController, false),
                      _provideTextField('Username', userNameController, false),
                      _provideTextField('Password', passwordController, true),

                      ButtonBar(children: [
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pushReplacementNamed('/authentication');
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (firstNameController.text.isEmpty || lastNameController.text.isEmpty || userNameController.text.isEmpty || passwordController.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildWarningPopupDialog(context),
                              );
                            } else {
                              service.createUser(firstNameController.text, lastNameController.text, userNameController.text, passwordController.text);
                              Navigator.of(context).pushReplacementNamed('/authentication');
                            }
                          },
                          child: const Text('Register'),
                        ),
                      ],)
                    ],
                  ),
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
          Text("Please fill up all fields"),
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
