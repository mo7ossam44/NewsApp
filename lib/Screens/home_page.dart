import 'package:flutter/material.dart';
import 'package:news_cloud/Widgets/categories_list_view.dart';
import 'package:news_cloud/Widgets/news_container_listview.dart';
import 'package:news_cloud/Widgets/rich_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: RichTextWidget()),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          //? -> you must used widget<Sliver> only here
          SliverToBoxAdapter(child: CategoriesListView()),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const NewsContainerListView(),
        ],
      ),
    );
  }
}
