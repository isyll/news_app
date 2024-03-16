import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/fake_datas.dart';
import 'package:news_app/widgets/article_item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<ArticleModel> _articles = [];
  bool _isLoading = false;
  bool _notFound = false;

  Future<void> _fetchArticles() async {
    setState(() {
      _isLoading = true;
      _notFound = false;
    });

    try {
      await Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _articles = fakeArticles(15);
          _isLoading = false;
          _notFound = _articles.isEmpty;
        });
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error $error');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<Widget> get _articlesWidgets =>
      _articles.map((article) => ArticleItem(article)).toList();

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: Text(
          'chargement...',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      if (!_notFound && _articles.isEmpty) {
        _fetchArticles();
      }
      return ListView(children: _articlesWidgets);
    }
  }
}
