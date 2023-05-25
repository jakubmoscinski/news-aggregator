import 'package:flutter/material.dart';
import 'package:news_aggregator_ui/model/article_model.dart';
import 'package:news_aggregator_ui/service/bookmark_service.dart';
import 'package:news_aggregator_ui/service/favorite_news_service.dart';
import 'package:news_aggregator_ui/view/content_view.dart';
import 'package:news_aggregator_ui/view/news_view.dart';
import 'package:provider/provider.dart';

class BookmarksView extends StatelessWidget {
  final String user;

  const BookmarksView({super.key, required this.user});

  ///Provides layout of [BookmarksView] widgets
  ///Provides integration with [Provider] and [BookmarkService] - handles asynchronous content updates
  ///Interacts with [Route] - (Routing)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
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
      body: Center(
        child: ChangeNotifierProvider(
            create: (_) => BookmarkService(),
            builder: (context, child) {
              return Consumer<BookmarkService>(builder: (context, value, child) {
                context.read<BookmarkService>().fetchData(user);

                return Center(
                  child: ListView(children: _formatArticles(value.articles, context)),
                );
              });
            }),
      ),
    );
  }

  ///Wraps list of [ArticleModel] into a widgets user can interact with
  List<Widget> _formatArticles(List<ArticleModel> articles, BuildContext context) {
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
                    return IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        context.read<FavoriteNewsService>().addToFavorites(user, article.id);
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
