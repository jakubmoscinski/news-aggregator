import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/model/article_model.dart';
import 'package:news_aggregator_ui/service/article_service.dart';
import 'package:news_aggregator_ui/service/favorite_news_service.dart';
import 'package:news_aggregator_ui/view/bookmarks_view.dart';
import 'package:news_aggregator_ui/view/content_view.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatelessWidget {
  final String user;

  const NewsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$user's news"),
        automaticallyImplyLeading: false,
        actions: [
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          BookmarksView(user: user)
                      )
                  );
                },
                child: const Text('Bookmarks'),
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
                  child: ListView(children: _formatArticles(value.articles, user, context)),
                );
              });
            }),
      ),
    );
  }

  List<Widget> _formatArticles(List<ArticleModel> articles, String user, BuildContext context) {
    //todo further formatting
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>
                      ContentView(user: user, url: article.url)
                  )
              );
            },
            title: Text(
              article.title,
              style: const TextStyle(fontSize: 20),
            ),
            trailing: ChangeNotifierProvider(
                create: (_) => FavoriteNewsService(),
                builder: (context, child) {
                  return Consumer<FavoriteNewsService>(builder: (context, value, child) {
                    context.read<FavoriteNewsService>().checkIfFavorite(user, article.id);

                    return IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: value.isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        context
                            .read<FavoriteNewsService>()
                            .addToFavorites(user, article.id);
                      },
                    );
                  });
                }),
          ),
        ),
      );

      paddings.add(padding);
    }

    return paddings;
  }
}