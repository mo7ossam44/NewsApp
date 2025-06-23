class ArticleModel {
  final String? url;
  final String? title;
  final String? author;
  final String? subtitle;
  final String? urlToImage;
  ArticleModel({
    required this.url,
    required this.title,
    required this.author,
    required this.subtitle,
    required this.urlToImage,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      url: json['url'],
      title: json['title'],
      author: json['author'],
      subtitle: json['description'],
      urlToImage: json['urlToImage'],
    );
  }
}
