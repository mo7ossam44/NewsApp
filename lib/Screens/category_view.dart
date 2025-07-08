import 'package:flutter/material.dart';
import 'package:news_cloud/Widgets/news_list_view_builder.dart';
import 'package:news_cloud/Widgets/rich_text.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: RichTextWidget(), iconTheme: IconThemeData(color: Colors.orange),),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [NewsListViewBuilder(category:category)],
      ),
    );
  }
}
