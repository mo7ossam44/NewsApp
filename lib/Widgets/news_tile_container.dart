import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';

class NewsTileContainer extends StatelessWidget {
  const NewsTileContainer({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: articleModel.urlToImage != null
                ? Image.network(
                    articleModel.urlToImage!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : SizedBox(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Text(
            articleModel.title ?? '',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            maxLines: 2,
            articleModel.subtitle ?? '',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
