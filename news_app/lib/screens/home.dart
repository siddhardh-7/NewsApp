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
  bool loading = true;

  List<CategoryModel> category = <CategoryModel>[];
  List<ArticleModel> article = <ArticleModel>[];

  // fetching news data
  Future<void> GetNews() async {
    News newsData = News();
    await newsData.getNews();
    article = newsData.articlesData;
    setState(() {
      loading = false;
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
        title: const Center(
          child: Text('T I M E L I N E'),
        ),
        backgroundColor: AppColors.blackshade3,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: AppColors.mainColor1,
      //   elevation: 0,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_rounded,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.search_outlined), label: 'Serach'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
      //   ],
      // ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  // Swiper(
                  //   itemCount: article.length,
                  //   viewportFraction: 0.8,
                  //   itemWidth: 400.0,
                  //   scale: 0.9,
                  //   layout: SwiperLayout.STACK,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return NewsTemplate(
                  //       title: article[index].title,
                  //       description: article[index].description,
                  //       url: article[index].url,
                  //       urlToImage: article[index].urlToImage,
                  //     );
                  //   },
                  // ),
                  Column(
                    children: [
                      for (int index = 0; index < article.length; index++)
                        NewsTemplate(
                          title: article[index].title,
                          description: article[index].description,
                          url: article[index].url,
                          urlToImage: article[index].urlToImage,
                        ),
                    ],
                  ),

                  // ListView.builder(
                  //     physics: ClampingScrollPhysics(),
                  //     itemCount: article.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return NewsTemplate(
                  //         title: article[index].title,
                  //         description: article[index].description,
                  //         url: article[index].url,
                  //         urlToImage: article[index].urlToImage,
                  //       );
                  //     }),
                ],
              ),
            ),
    );
  }
}
