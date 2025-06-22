import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Services/news_service.dart';
import 'package:news_cloud/Widgets/complete_circle_progress.dart';
import 'package:news_cloud/Widgets/error_message.dart';
import 'package:news_cloud/Widgets/news_sliver_list.dart';



class NewsListViewBuilder extends StatefulWidget {
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
  final String category;

  const NewsListViewBuilder({super.key, required this.category});
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articlesNewsContainerList = [];

  var myFuture;

  @override
  void initState() {
    super.initState();
    myFuture = NewsService().getNews(category: widget.category);
  }

  //! Second Level in STF LisfeCycle
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      //! أنا هنا ف السطر بستدعي الميثود يعني بعمل تريجر ليها
      //! future att : وهنا بردو بحط ودني عشان أعرف التايب بتاع الي قدامه
      future: myFuture,
      builder: (context, snapshot) {
        //! 3 STATS Mangment
        if (snapshot.hasData) {
          return NewsSliverList(articlesNewsContainerList: snapshot.data!);
        } else if (snapshot.hasError) {
          return ErrorMesssage(message: 'error 404');
        } else {
          return CompleteCircleWidget();
        }
      },
    );
  }
}



  //! First Level in STF LisfeCycle
  //! init state called only one time
  //! cannot make init state asynchrons method
  // ? @override
  // ? void initState() {
  // ?  super.initState();
  // ?  newsServiceMethod();
  // ? }

  //! if you use a future builder widget bacame able to remove setstate (Future builder can handle this part without need any setstate)
  // ? Future<void> newsServiceMethod() async {
  // ?  articlesNewsContainerList = await NewsService().getNews();
  // ?  isLoading = false;
  // ?  setState(() {});
  // ? }


  // return isLoading
    //     ? SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(
    //           child: CircularProgressIndicator(color: Colors.orange),
    //         ),
    //       )
    //     : articlesNewsContainerList.isNotEmpty
    //     ? NewsSliverList(articlesNewsContainerList: articlesNewsContainerList)
    //     : SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image.asset('assets/images/mark.png', width: 100),
    //             Center(
    //               child: Text(
    //                 'error 404',
    //                 style: TextStyle(
    //                   color: Colors.red,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );