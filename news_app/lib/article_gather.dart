import 'dart:convert';

import 'models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> articlesData = <ArticleModel>[];

  Future<void> getNews() async {
    var response = await http.get(Uri.https('newsapi.org',
        'v2/top-headlines?country=us&apiKey=3531c3b518234b20b9175666157a5823'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          articlesData.add(articleModel);
        }
      });
    }
  }
}

// category news
class CategoryNews {
  List<ArticleModel> articlesData = <ArticleModel>[];

  Future<void> getNews(String category) async {
    var response = await http.get(Uri.https('newsapi.org',
        'v2/top-headlines?country=us&category=$category&apiKey=3531c3b518234b20b9175666157a5823'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          articlesData.add(articleModel);
        }
      });
    }
  }
}
