import 'package:flutter/material.dart';
import 'package:news_app/article_gather.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utilities/colors.dart';
import 'package:news_app/utilities/dimensions.dart';
import 'package:news_app/widgets/news_template.dart';

class CategoryScreen extends StatefulWidget {
  static String id = 'categoryScreen';
  String categoryName;
  CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _loading = true;

  List<ArticleModel> articles = <ArticleModel>[];

  Future<void> getNews() async {
    CategoryNews newsData = CategoryNews();
    await newsData.getNews(widget.categoryName);
    articles = newsData.articlesData;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(right: Dimensions.width10 * 4),
          alignment: Alignment.center,
          child: Text(widget.categoryName.toUpperCase()),
        ),
        backgroundColor: AppColors.blackshade3,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor1,
              ),
            )
          : SingleChildScrollView(
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
