import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Widgets/author_card.dart';
import 'package:news_cloud/Widgets/rich_text.dart';

class SingleNew extends StatelessWidget {
  const SingleNew({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichTextWidget(),
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: CustomScrollView(
        slivers: [
          articleModel.urlToImage == null
              ? SliverToBoxAdapter(
                  child: Hero(
                    tag: articleModel.author!,
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          'There is no photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.network(
                      articleModel.urlToImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    articleModel.title ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 10),
                  SizedBox(height: 20),
                  AuthorCard(articleModel: articleModel),
                  SizedBox(height: 10),
                  Text(
                    articleModel.subtitle ??
                        'There is no subtitle in this new tile only the title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
