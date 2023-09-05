import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/ProductView/ProductView_widgets/productAppBar.dart';

class CategoryView2 extends StatefulWidget {
  final int pageNo;
  final String categoryName;
  const CategoryView2(
      {super.key, required this.pageNo, required this.categoryName});

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
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductAppBar(
                categoryName: widget.categoryName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
