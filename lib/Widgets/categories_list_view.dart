import 'package:flutter/material.dart';
import 'package:news_cloud/Models/category_model.dart';
import 'package:news_cloud/Widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<CategoryModel> categoriesList = [
    CategoryModel(name: 'Busness', image: 'assets/images/business2.jpg'),
    CategoryModel(name: 'Entertiment', image: 'assets/images/enter.jpg'),
    CategoryModel(name: 'General', image: 'assets/images/global.jpg'),
    CategoryModel(name: 'Sports', image: 'assets/images/spo.jpg'),
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
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
