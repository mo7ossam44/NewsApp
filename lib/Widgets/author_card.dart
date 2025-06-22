import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 70),
                child: Text(
                  articleModel.author ?? 'No author available',
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.orange,
                  ),
                ),
              ),
              Text('author'),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Text('Follow'),
          ),
        ],
      ),
    );
  }
}
