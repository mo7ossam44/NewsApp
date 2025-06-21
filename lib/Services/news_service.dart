import 'package:dio/dio.dart';
import 'package:news_cloud/Models/article_model.dart';

class NewsService {
  final dio = Dio();

  NewsService();

  Future<List<ArticleModel>> getNews() async {
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?apiKey=9e5cc3ee00bb42a6b548efea72a0d1d3&country=us&category=general',
    );
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlessListModel = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        title: article['title'],
        subtitle: article['description'],
        urlToImage: article['urlToImage'],
      );
      articlessListModel.add(articleModel);
    }
    return articlessListModel;
  }
}
