import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/article_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(
      {super.key, required this.articles, this.divideItems = false});

  /// List of articles.
  final List<ArticleModel> articles;

  /// Print horizontal divider between article items.
  final bool divideItems;

  final _dividerHeight = 34.0;

  List<Widget> get _articlesWidgets =>
      articles.map((article) => ArticleItem(article)).toList();

  Widget get _divider => Divider(
        color: Colors.black87,
        height: _dividerHeight,
        thickness: 1,
      );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          divideItems ? _divider : SizedBox(height: _dividerHeight),
      itemBuilder: (context, index) => _articlesWidgets[index],
      itemCount: _articlesWidgets.length,
    );
  }
}
