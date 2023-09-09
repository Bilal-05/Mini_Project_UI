import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
import 'package:mini_project/widgets/cartIcon.dart';

class CartAppBar extends StatefulWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
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
        const Text(
          'Shopping Cart',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: TextColors.textColor3),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: const FaIcon(
            FontAwesomeIcons.bagShopping,
            color: TextColors.textColor3,
            size: 25,
          ),
        ),
      ],
    );
  }
}
