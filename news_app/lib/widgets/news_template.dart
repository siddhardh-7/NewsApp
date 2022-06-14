import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/dimensions.dart';

class NewsTemplate extends StatefulWidget {
  String title, description, url, urlToImage;
  NewsTemplate(
      {Key? key,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage})
      : super(key: key);

  @override
  State<NewsTemplate> createState() => _NewsTemplateState();
}

class _NewsTemplateState extends State<NewsTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width10 * 39,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.urlToImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Dimensions.borderRadius12),
        color: Colors.black26,
      ),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(Dimensions.borderRadius12),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10 * 5,
            vertical: Dimensions.height10 * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black.withOpacity(0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.borderRadius5),
                  topRight: Radius.circular(Dimensions.borderRadius5),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.urlToImage,
                  height: Dimensions.height10 * 15,
                  width: Dimensions.width10 * 29,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: Dimensions.width10 * 29,
              padding: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                bottom: Dimensions.height10 / 2,
              ),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  // border: Border.all(
                  //   color: AppColors.blackshade1,
                  // ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.borderRadius5),
                      bottomRight: Radius.circular(Dimensions.borderRadius5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    widget.description,
                    style:
                        TextStyle(fontSize: 15, color: AppColors.blackshade1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
