import 'dart:convert';
import 'models/article_model.dart';
import 'package:http/http.dart' as http;

// for top headlines news
class News {
  List<ArticleModel> articlesData = <ArticleModel>[];

  Future<void> getNews() async {
    var apiKey = '3531c3b518234b20b9175666157a5823';
    var url = Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&language=en&apiKey=${apiKey}');

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          print(articleModel.title + '\n');
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
    var apiKey = '3531c3b518234b20b9175666157a5823';
    var url = Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&sortBy=publishedAt&language=en&apiKey=${apiKey}');

    var response = await http.get(url);
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
          print(articleModel.title + '\n');
          articlesData.add(articleModel);
        }
      });
    }
  }
}
