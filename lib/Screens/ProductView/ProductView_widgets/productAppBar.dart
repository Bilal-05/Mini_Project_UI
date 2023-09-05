import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
import 'package:mini_project/widgets/cartButton.dart';
import 'package:mini_project/widgets/searchButton.dart';

class ProductAppBar extends StatelessWidget {
  final String categoryName;
  const ProductAppBar({super.key, required this.categoryName});

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
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 20,
                  color: TextColors.textColor3,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          categoryName,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: TextColors.textColor3),
        ),
        const Spacer(),
        const SearchIcon(
          iconColor: SecondaryColors.secondaryBlack01,
        ),
        const SizedBox(
          width: 20,
        ),
        CartIcon(
          itemNumber: GetItemNumber.getItemNumber(),
          iconColor: SecondaryColors.secondaryBlack01,
          numberCircleColor: TextColors.textColor1,
        ),
      ],
    );
  }
}
