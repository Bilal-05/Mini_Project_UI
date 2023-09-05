import 'package:flutter/material.dart';
import 'package:mini_project/DataBases/Categories.dart';
import 'package:mini_project/Screens/MainMenuView/Views/CategoriesScreen-1/CategoryFirstContainer/firstContainer_Category.dart';
import 'package:mini_project/Screens/MainMenuView/Views/CategoriesScreen-1/Rest_of_the_CategoryScreen/productGrid_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FirstCategoryContainer(),
              Products(
                Categories: Categories.category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
