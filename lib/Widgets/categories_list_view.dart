import 'package:flutter/material.dart';
import 'package:news_cloud/Models/category_model.dart';
import 'package:news_cloud/Widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categoriesList = const [
    CategoryModel(name: 'business', image: 'assets/images/business2.jpg'),
    CategoryModel(name: 'entertainment', image: 'assets/images/enter.jpg'),
    CategoryModel(name: 'general', image: 'assets/images/global.jpg'),
    CategoryModel(name: 'sports', image: 'assets/images/spo.jpg'),
    CategoryModel(name: 'technology', image: 'assets/images/technology.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categoriesList[index]);
        },
        scrollDirection: Axis.horizontal, 
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
