import 'package:flutter/material.dart';
import 'package:news_cloud/Models/article_model.dart';
import 'package:news_cloud/Widgets/complete_circle_progress.dart';
import 'package:news_cloud/Widgets/rich_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SingleNew extends StatefulWidget {
  @override
  State<SingleNew> createState() => _SingleNewState();
  final ArticleModel articleModel;

  const SingleNew({super.key, required this.articleModel});
}

class _SingleNewState extends State<SingleNew> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // ✅ لازم تستدعي Platform-specific implementation هنا
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.articleModel.url ?? ''));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichTextWidget(),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: isLoading
          ? CompleteCircleWidget()
          : WebViewWidget(controller: _controller),
    );
  }
}

    
      // body: CustomScrollView(
      //   slivers: [
      //     widget.articleModel.urlToImage == null
      //         ? SliverToBoxAdapter(
      //             child: Hero(
      //               tag: widget.articleModel.author!,
      //               child: Container(
      //                 width: double.infinity,
      //                 height: 300,
      //                 color: Colors.orange,
      //                 child: Center(
      //                   child: Text(
      //                     'There is no photo',
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 25,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           )
      //         : SliverToBoxAdapter(
      //             child: Container(
      //               width: double.infinity,
      //               height: 300,
      //               child: Image.network(
      //                 widget.articleModel.urlToImage!,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //     SliverToBoxAdapter(
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //         child: Column(
      //           children: [
      //             SizedBox(height: 20),
      //             Text(
      //               widget.articleModel.title ?? '',
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //             // SizedBox(height: 10),
      //             SizedBox(height: 20),
      //             AuthorCard(articleModel: widget.articleModel),
      //             SizedBox(height: 10),
      //             Text(
      //               widget.articleModel.subtitle ??
      //                   'There is no subtitle in this new tile only the title',
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.normal,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
