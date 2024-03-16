import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';

List<ArticleModel> fakeArticles(int total) {
  final List<ArticleModel> articles = [];

  for (var i = 1; i <= total; i++) {
    final source = SourceModel(id: '$i', name: 'CNN');
    final article = ArticleModel(
        source: source,
        author: 'Ibrahima Sylla',
        title:
            'Steelers trade QB Kenny Pickett to Eagles, clearing way for Russell Wilson to start, per reports - USA TODAY',
        description: null,
        imgUrl: Uri.parse(
            'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1878228781.jpg?c=16x9&q=w_800,c_fill'),
        date: DateTime.now(),
        content:
            'The 6% commission, a standard in home purchase transactions, is no more.\r\nIn a sweeping move expected to dramatically reduce the cost of buying and selling a home, the National Association of Realtor… [+7961 chars]');

    articles.add(article);
  }

  return articles;
}
