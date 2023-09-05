import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/Views/CategoriesScreens/CategoriesScreen-1/CategoryFirstContainer/firstContainer_Category.dart';

class CategoryView2 extends StatefulWidget {
  final int pageNo;
  const CategoryView2({super.key, required this.pageNo});

  @override
  State<CategoryView2> createState() => _CategoryView2State();
}

class _CategoryView2State extends State<CategoryView2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Center(
          child: Text("${widget.pageNo}"),
        ),
      ),
    ));
  }
}
