import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/view/news_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentView extends StatelessWidget {
  final String user;
  final String url;

  const ContentView({super.key, required this.user, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content'),
        automaticallyImplyLeading: false,
        actions: [
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          NewsView(user: user)
                      )
                  );
                },
                child: const Text('Articles'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/authentication'),
                child: const Text("Logout"),
              ),
            ],
          )
        ],
      ),
      body: WebViewApp(url: url)
    );
  }
}

class WebViewApp extends StatefulWidget {
  final String url;

  const WebViewApp({super.key, required this.url});


  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
