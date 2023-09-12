import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  final String screenName;
  const CustomAppBar({super.key, required this.screenName});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: TextColors.textColor1,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: TextColors.textColor3.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: const Center(child: BackButton()),
        ),
        const SizedBox(width: 20),
        Text(
          widget.screenName,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: TextColors.textColor3),
        ),
      ],
    );
  }
}
