import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(this.article, {super.key});

  final ArticleModel article;

  final _decoration = const BoxDecoration(color: Colors.black12, boxShadow: [
    // BoxShadow(
    //   color: Colors.greenAccent,
    //   offset: Offset(
    //     5.0,
    //     5.0,
    //   ),
    //   blurRadius: 10.0,
    //   spreadRadius: 2.0,
    // ),
    // BoxShadow(
    //   color: Colors.white,
    //   offset: Offset(0.0, 0.0),
    //   blurRadius: 0.0,
    //   spreadRadius: 0.0,
    // ),
  ]);

  final _titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  Widget _articleImg(ArticleModel article) {
    final widget = article.imgUrl == null
        ? SizedBox(height: 22, width: 22, child: Container(color: Colors.red))
        : Image.network(article.imgUrl.toString(), height: 70);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _decoration,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 12, left: 6, right: 8),
            child: Row(children: [
              _articleImg(article),
              Flexible(child: Text(article.title, style: _titleStyle))
            ])));
  }
}
