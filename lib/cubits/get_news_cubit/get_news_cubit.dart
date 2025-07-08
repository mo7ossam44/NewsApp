import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Services/news_service.dart';
import 'package:news_cloud/cubits/get_news_cubit/get_news_state.dart';

class GetNewsCubit extends Cubit<NewsStates> {
  GetNewsCubit() : super(NewsLoading());

  List<ArticleModel> articles = [];

  Future<void> fetchNews({required String cityName}) async {
    try {
      articles = await NewsService().getNews(category: cityName);
      emit(NewsSucess());
    } catch (e) {
      emit(NewsFaluire(e.toString()));
    }
  }
  List<ArticleModel> getDataNews() => articles;
}
