import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/lists/categorylist.dart';
import 'package:news_app/utilities/colors.dart';
import 'package:news_app/utilities/dimensions.dart';

import '../models/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = <CategoryModel>[];

  @override
  void initState() {
    super.initState();
    category = getCategory();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.only(left: Dimensions.width10),
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
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryImageUrl, categoryName;

  CategoryTile({required this.categoryName, required this.categoryImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
            right: Dimensions.width10, top: Dimensions.height10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
              child: CachedNetworkImage(
                imageUrl: categoryImageUrl,
                width: 110,
              ),
            ),
            Container(
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
                // image: DecorationImage(
                //   image: NetworkImage(categoryImageUrl),
                //   fit: BoxFit.cover,
                // ),
              ),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
