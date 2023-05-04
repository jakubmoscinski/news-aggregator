import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/model/article_model.dart';
import 'package:news_aggregator_ui/service/article_service.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        automaticallyImplyLeading: false,
        actions: [
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/bookmarks'),
                child: const Text("Bookmarks"),
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
      body: Center(
        child: ChangeNotifierProvider(
            create: (_) => ArticleService(),
            builder: (context, child) {
              return Consumer<ArticleService>(builder: (context, value, child) {
                context.read<ArticleService>().fetchData();

                return Center(
                  child: ListView(
                    children: _formatArticles(value.articles)
                  ),
                );
              });
            }),
      ),
    );
  }

  List<Widget> _formatArticles(List<ArticleModel> articles) {//todo further formatting
    List<Padding> paddings = [];

    for (ArticleModel article in articles) {
      final padding = Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white10,
          child: ListTile(
            contentPadding: const EdgeInsets.all(5),
            dense: true,
            onTap: () async {

            },
            title: Text(
              article.title,
              style: const TextStyle(fontSize: 20),
            ),
            trailing: const Icon(Icons.bookmark),
          ),
        ),
      );

      paddings.add(padding);
    }

    return paddings;
  }

}
