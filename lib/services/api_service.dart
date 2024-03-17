import 'package:http/http.dart' as http;

import 'package:news_app/config/constants.dart';
import 'package:news_app/config/secrets.dart';

class ApiService {
  static Uri get topHeadlinesUri => Uri.parse('${Constants.apiUrl}/top-headlines');
  static Map<String, String> get headers => {'Authorization': Secrets.apiKey};

  static Future<http.Response> getTopHeadlines(String countryCode) {
    final uri =
        topHeadlinesUri.replace(queryParameters: {'country': countryCode});
    return http.get(uri, headers: headers);
  }
}
