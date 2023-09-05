import 'package:flutter/material.dart';

class CategoryView2 extends StatelessWidget {
  final int pageNo;
  const CategoryView2({super.key, required this.pageNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "$pageNo",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
