import 'package:flutter/material.dart';
import 'package:news_app/article_gather.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_template.dart';

class CategoryScreen extends StatefulWidget {
  static String id = 'categoryScreen';
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = <ArticleModel>[];

  Future<void> GetNews() async {
    CategoryNews newsData = CategoryNews();
    await newsData.getNews('');
    articles = newsData.articlesData;
  }

  @override
  void initState() {
    super.initState();
    GetNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: articles.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NewsTemplate(
                title: articles[index].title,
                description: articles[index].description,
                url: articles[index].url,
                urlToImage: articles[index].urlToImage,
              );
            }),
      ),
    );
  }
}
