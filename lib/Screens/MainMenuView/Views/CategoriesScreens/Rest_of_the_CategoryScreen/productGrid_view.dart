import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/ProductView/Product_View.dart';

class Products extends StatelessWidget {
  final List Categories;
  const Products({super.key, required this.Categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.75),
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ProductView(
                        pageNo: index,
                        categoryName: Categories[index]['categoryName'],
                      ),
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
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
                      "${Categories[index]["categoryImage"]}",
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
                      "${Categories[index]['categoryName']}",
                      style: const TextStyle(
                          color: TextColors.textColor3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${Categories[index]['categoryOrigin']}",
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
        }),
      ),
    );
  }
}
