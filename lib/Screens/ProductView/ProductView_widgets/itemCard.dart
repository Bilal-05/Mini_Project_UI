import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/Views/FavoriteScreen/favorite_view.dart';

import '../../../Constants/colors.dart';

class ProductCard extends StatelessWidget {
  final Map TagList;
  const ProductCard({super.key, required this.TagList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                      opacity: animation, child: FavoriteView());
                }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TextColors.textColor1,
          border: Border.all(
            width: 0.5,
            color: TextColors.textColor2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "${TagList['itemImage']}",
                height: 160,
                width: 130,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 120,
              decoration: BoxDecoration(
                color: SecondaryColors.secondaryGrey01,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "${TagList['itemName']}",
                style: const TextStyle(
                    color: TextColors.textColor3,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                "${TagList['itemOrigin']}",
                style: const TextStyle(
                    color: TextColors.textColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
