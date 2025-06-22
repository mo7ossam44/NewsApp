import 'package:flutter/material.dart';
import 'package:news_cloud/Models/category_model.dart';
import 'package:news_cloud/Screens/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: categoryModel.name,);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        alignment: Alignment.center,
        width: 240,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(categoryModel.image),
          ),
        ),
        child: Text(
          categoryModel.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
