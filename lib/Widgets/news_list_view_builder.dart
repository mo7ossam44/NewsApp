import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/Widgets/complete_circle_progress.dart';
import 'package:news_cloud/Widgets/error_message.dart';
import 'package:news_cloud/Widgets/news_sliver_list.dart';
import 'package:news_cloud/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:news_cloud/cubits/get_news_cubit/get_news_state.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNewsCubit>(context).fetchNews(cityName: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return CompleteCircleWidget();
        } else if (state is NewsFaluire) {
          return ErrorMesssage(message: 'The Error : ${state.errorMessage}');
        } else {
          final data = BlocProvider.of<GetNewsCubit>(context).getDataNews();
          return NewsSliverList(articlesNewsContainerList: data);
        }
      },
    );
  }
}

// class NewsListViewBuilder extends StatefulWidget {
//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();

//   final String category;
//   const NewsListViewBuilder({super.key, required this.category});
// }

// class _NewsListViewBuilderState extends State<NewsListViewBuilder> {

//   var myFuture;

//   @override
//   void initState() {
//     super.initState();
//     myFuture = NewsService().getNews(category: widget.category);
//   }

//   //? Second Level in STF LisfeCycle
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ArticleModel>>(
//       //? أنا هنا ف السطر بستدعي الميثود يعني بعمل تريجر ليها
//       //? future att : وهنا بردو بحط ودني عشان أعرف التايب بتاع الي قدامه
//       future: myFuture,
//       builder: (context, snapshot) {
//         //? 3 STATS Mangment
//         if (snapshot.hasData) {
//           return NewsSliverList(articlesNewsContainerList: snapshot.data!);
//         } else if (snapshot.hasError) {
//           return ErrorMesssage(message: 'error 404');
//         } else {
//           return CompleteCircleWidget();
//         }
//       },
//     );
//   }
// }
