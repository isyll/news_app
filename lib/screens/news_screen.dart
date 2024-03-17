import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/widgets/article_list.dart';

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
      final response = await ApiService.getTopHeadlines('us');
      setState(() {
        final jsonData = json.decode(response.body);
        _articles = ArticleModel.fromJsonArray(jsonData['articles']);
        _isLoading = false;
        _notFound = _articles.isEmpty;
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

  get _widget {
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
      return ArticleList(articles: _articles);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _widget);
  }
}
