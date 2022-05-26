import 'package:flutter/material.dart';
import 'package:news_app/lists/categorylist.dart';
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/news_template.dart';
import '../article_gather.dart';
import 'package:news_app/utilities/colors.dart';
import 'package:news_app/utilities/dimensions.dart';
import '../models/category_model.dart';
import '../models/article_model.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;

  List<CategoryModel> category = <CategoryModel>[];
  List<ArticleModel> article = <ArticleModel>[];

  // fetching news data
  Future<void> GetNews() async {
    News newsData = News();
    await newsData.getNews();
    article = newsData.articlesData;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    category = getCategory();
    GetNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Center(
          child: Text('T I M E L I N E'),
        ),
        backgroundColor: AppColors.blackshade3,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor1,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Serach'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor1,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Dimensions.height10 * 6,
                    margin: EdgeInsets.only(top: Dimensions.height10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                            categoryName: category[index].categoryName,
                            categoryImageUrl: category[index].imageUrl);
                      },
                    ),
                  ),
                  ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: article.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NewsTemplate(
                          title: article[index].title,
                          description: article[index].description,
                          url: article[index].url,
                          urlToImage: article[index].urlToImage,
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
