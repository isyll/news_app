import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/utils/string.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(this.article, {super.key});

  final ArticleModel article;

  final _decoration = const BoxDecoration(color: Colors.black12);

  final _titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

  Widget _articleImg(ArticleModel article) {
    final widget = article.imgUrl == null
        ? const Padding(padding: EdgeInsets.symmetric(vertical: 5))
        : Image.network(article.imgUrl.toString());

    return ClipRect(child: widget);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleScreen(article: article)),
          );
        },
        child: Container(
            decoration: _decoration,
            child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                child: Column(children: [
                  _articleImg(article),
                  const SizedBox(height: 10),
                  Text(truncateString(article.title, 67), style: _titleStyle),
                  const SizedBox(height: 10),
                ]))));
  }
}
