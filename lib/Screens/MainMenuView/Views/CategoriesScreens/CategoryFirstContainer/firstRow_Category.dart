import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/widgets/cartButton.dart';
import 'package:mini_project/widgets/searchButton.dart';
//import 'package:mini_project/DataBases/InCart.dart';

class FirstCategoryRow extends StatefulWidget {
  final int itemNumber;
  const FirstCategoryRow({super.key, required this.itemNumber});

  @override
  State<FirstCategoryRow> createState() => _FirstCategoryRowState();
}

class _FirstCategoryRowState extends State<FirstCategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Hello, Bilal",
          style: TextStyle(
              color: TextColors.textColor1,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
        const Spacer(),
        const SearchIcon(
          iconColor: TextColors.textColor1,
        ),
        CartIcon(
          itemNumber: widget.itemNumber,
          iconColor: TextColors.textColor1,
          numberCircleColor: PrimaryColors.primaryBlue,
        )
      ],
    );
  }
}
