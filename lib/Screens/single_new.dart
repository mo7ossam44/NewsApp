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