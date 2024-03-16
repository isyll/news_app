import 'package:news_app/models/source_model.dart';

class ArticleModel {
  const ArticleModel(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.imgUrl,
      required this.date,
      required this.content});

  final SourceModel source;
  final String? author;
  final String title;
  final String? description;
  final Uri? imgUrl;
  final DateTime date;
  final String? content;

  static ArticleModel fromJson(Map<String, dynamic> json) {
    final source = SourceModel.fromJson(json['source'] as Map<String, dynamic>);
    return ArticleModel(
        source: source,
        author: json['author'],
        title: json['title'],
        description: json['description'] ,
        imgUrl: json['urlToImage'] == null
            ? null
            : Uri.parse(json['urlToImage'] as String),
        date: DateTime.parse(json['publishedAt'] as String),
        content: json['content']);
  }
}
