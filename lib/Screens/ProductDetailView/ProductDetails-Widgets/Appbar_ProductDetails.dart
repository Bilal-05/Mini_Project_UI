import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
import 'package:mini_project/widgets/cartButton.dart';
import 'package:mini_project/widgets/searchButton.dart';

class DetailsAppBar extends StatelessWidget {
  final String itemName;
  const DetailsAppBar({super.key, required this.itemName});

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
          itemName,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: TextColors.textColor3),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: CartIcon(
            itemNumber: GetItemNumber.getItemNumber(),
            iconColor: SecondaryColors.secondaryBlack01,
            numberCircleColor: TextColors.textColor1,
          ),
        ),
      ],
    );
  }
}
