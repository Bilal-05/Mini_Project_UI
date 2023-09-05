import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  final Color iconColor;
  const SearchIcon({super.key, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search_outlined,
        color: iconColor,
        size: 30,
      ),
    );
  }
}
