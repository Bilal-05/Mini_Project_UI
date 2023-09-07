import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';

class ProductDetails extends StatelessWidget {
  final List ItemDetails;
  const ProductDetails({super.key, required this.ItemDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Details",
            style: TextStyle(
                color: TextColors.textColor3,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            // width: 327,
            height: 72,
            child: Text(
              ItemDetails[0]['itemDescription'],
              style: const TextStyle(
                  color: TextColors.textColor2,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
