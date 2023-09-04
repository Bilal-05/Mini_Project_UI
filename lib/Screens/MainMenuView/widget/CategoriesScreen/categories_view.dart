import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/widget/CategoriesScreen/CategoryFirstContainer/firstContainer_Category.dart';

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
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [FirstCategoryContainer()],
            ),
          ),
        ),
      ),
    );
  }
}
