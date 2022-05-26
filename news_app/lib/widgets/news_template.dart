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
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderRadius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black.withOpacity(0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.borderRadius12),
                topRight: Radius.circular(Dimensions.borderRadius12),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.urlToImage,
                height: Dimensions.height10 * 20,
                width: Dimensions.width10 * 39,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width10 / 2,
              right: Dimensions.width10 / 2,
              bottom: Dimensions.width10 / 2,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.blackshade1,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.borderRadius12),
                    bottomRight: Radius.circular(Dimensions.borderRadius12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
