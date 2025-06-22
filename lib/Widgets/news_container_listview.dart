import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Widgets/news_tile_container.dart';

class NewsContainerListView extends StatelessWidget {
  NewsContainerListView({super.key, required this.articlesNewsContainerList});

  final List<ArticleModel> articlesNewsContainerList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articlesNewsContainerList.length,
        (context, index) =>
            NewsTileContainer(articleModel: articlesNewsContainerList[index]),
      ),
    );
  }
}
