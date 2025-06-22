import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Widgets/news_container.dart';

class NewsSliverList extends StatelessWidget {
  const NewsSliverList({super.key, required this.articlesNewsContainerList});

  final List<ArticleModel> articlesNewsContainerList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articlesNewsContainerList.length,
        (context, index) =>
            NewsContainer(articleModel: articlesNewsContainerList[index]),
      ),
    );
  }
}
