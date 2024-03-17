import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              child: const Icon(Icons.arrow_back, size: 40),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const Expanded(
            child: Center(
          child: Text('Page de l\'Article'),
        ))
      ],
    ));
  }
}
