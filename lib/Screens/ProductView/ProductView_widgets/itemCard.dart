import 'package:flutter/material.dart';
import 'package:mini_project/Functions/addToCart.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetail_view.dart';

import '../../../Constants/colors.dart';

class ProductCard extends StatelessWidget {
  final Map TagList;
  final int Index;
  const ProductCard({super.key, required this.TagList, required this.Index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailView(itemName: TagList['itemName']);
            },
          ),
        );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    child: Image.asset(
                      "${TagList['itemImage']}",
                      height: 160,
                      width: 130,
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: "${TagList['itemName']}$Index",
                    onPressed: () {
                      AddToCart.addToCart(TagList['itemName']);
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 2,
                width: 140,
                decoration: BoxDecoration(
                  color: SecondaryColors.secondaryGrey01,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "\$${TagList['itemUnit']}",
                style: const TextStyle(
                    color: TextColors.textColor3,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "${TagList['itemName']}",
                style: const TextStyle(
                    color: TextColors.textColor3,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//             
//             Container(
//               margin: const EdgeInsets.only(top: 5),
//               child: Text(
//                 "${TagList['Tagline']}",
//                 style: const TextStyle(
//                     color: TextColors.textColor2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),