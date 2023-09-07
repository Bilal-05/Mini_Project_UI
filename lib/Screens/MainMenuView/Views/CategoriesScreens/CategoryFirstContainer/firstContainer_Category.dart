import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getItemNumber.dart';

import 'firstRow_Category.dart';

class FirstCategoryContainer extends StatefulWidget {
  const FirstCategoryContainer({super.key});

  @override
  State<FirstCategoryContainer> createState() => _FirstCategoryContainerState();
}

class _FirstCategoryContainerState extends State<FirstCategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      color: PrimaryColors.primaryBlue,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 63),
              child: FirstCategoryRow(
                itemNumber: GetItemNumber.getItemNumber(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shop",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: TextColors.textColor1,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "By Category",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: TextColors.textColor1,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
