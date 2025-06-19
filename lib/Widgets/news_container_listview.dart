import 'package:flutter/material.dart';
import 'package:news_cloud/Widgets/news_tile_container.dart';

class NewsContainerListView extends StatelessWidget {
  const NewsContainerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => NewsTileContainer(),
      ),
    );
  }
}
