import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Screens/single_new.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => SingleNew(articleModel: articleModel,))),
      child: Column(
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
                  : Container(
                      height: 200,
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
              articleModel.subtitle ??
                  'There is no subtitle in this new tile only the title',
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 17,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
