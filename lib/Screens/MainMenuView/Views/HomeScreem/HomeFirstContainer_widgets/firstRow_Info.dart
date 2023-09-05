import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/widgets/cartButton.dart';
//import 'package:mini_project/DataBases/InCart.dart';

class FirstRow extends StatefulWidget {
  final int itemNumber;
  const FirstRow({super.key, required this.itemNumber});

  @override
  State<FirstRow> createState() => _FirstRowState();
}

class _FirstRowState extends State<FirstRow> {
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
        CartIcon(
          itemNumber: widget.itemNumber,
          iconColor: TextColors.textColor1,
          numberCircleColor: PrimaryColors.primaryBlue,
        )
      ],
    );
  }
}
