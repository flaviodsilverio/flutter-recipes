import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/widgets/category_item.dart';
import 'package:recipes/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        ),
      body: GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map( (element) =>  
        CategoryItem(element)
      ).toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: (3 / 2),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20
      ),
    )
    );    
  }
}