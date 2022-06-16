import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/category_screen.dart';

import '../utilities/dimensions.dart';

class CategoryTile extends StatelessWidget {
  final String categoryImageUrl, categoryName;

  const CategoryTile(
      {Key? key, required this.categoryName, required this.categoryImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryName: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
            left: Dimensions.width10 / 2, right: Dimensions.width10 / 2),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
              child: CachedNetworkImage(
                imageUrl: categoryImageUrl,
                width: Dimensions.width10 * 11,
                height: Dimensions.height10 * 6,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: Dimensions.width10 * 11,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
              ),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
