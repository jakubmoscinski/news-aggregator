///Article Domain class
class ArticleModel {
  final int id;
  final String author;
  final String source;
  final String title;
  final String url;

  ArticleModel({
    required this.id,
    required this.author,
    required this.source,
    required this.title,
    required this.url,
  });
}