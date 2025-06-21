import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Services/news_service.dart';
import 'package:news_cloud/Widgets/news_tile_container.dart';

class NewsContainerListView extends StatefulWidget {
  NewsContainerListView({super.key});

  @override
  State<NewsContainerListView> createState() => _NewsContainerListViewState();
}

class _NewsContainerListViewState extends State<NewsContainerListView> {
  bool isLoading = true;
  List<ArticleModel> articlesNewsContainerList = [];

  //! First Level in STF LisfeCycle
  //! init state called only one time
  //! cannot make init state asynchrons method
  @override
  void initState() {
    super.initState();
    newsServiceMethod();
  }

  Future<void> newsServiceMethod() async {
    articlesNewsContainerList = await NewsService().getNews();
    isLoading = false;
    setState(() {});
  }

  //! Second Level in STF LisfeCycle
  //! cannot call any method in a build method to avoid rebuild alot of times
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: Colors.amber),
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articlesNewsContainerList.length,
              (context, index) => NewsTileContainer(
                articleModel: articlesNewsContainerList[index],
              ),
            ),
          );
  }

  //! Last Level in STF LisfeCycle
  @override
  void dispose() {
    super.dispose();
  }
}
