import 'package:flutter/material.dart';
import 'models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(category.title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.7),
            category.color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight, 
        ),
        borderRadius: BorderRadius.circular(15)
        ),
    );
  }
}