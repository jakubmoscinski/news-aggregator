import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Aggregator'),
        automaticallyImplyLeading: false,
        actions: [
          ButtonBar(
            children: [
              ElevatedButton(
                //todo extract to separate method
                onPressed: () =>
                    Navigator.of(context).pushNamed('/authentication'),
                child: const Text("Logout"),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Article 1"),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Article 2"),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Article 3"),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Article 4"),
              ),
            ]
        ),
      )
    );
  }



}
