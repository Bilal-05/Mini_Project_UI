import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
import 'package:mini_project/Screens/CartView/cart_view.dart';

import '../Constants/colors.dart';

class CartOnlyIcon extends StatefulWidget {
  final Color numberCircleColor;
  final Color iconColor;
  final int itemNumber;
  const CartOnlyIcon(
      {super.key,
      required this.itemNumber,
      required this.iconColor,
      required this.numberCircleColor});

  @override
  State<CartOnlyIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartOnlyIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          SizedBox(
            width: 35,
            child: FaIcon(
              FontAwesomeIcons.bagShopping,
              color: widget.iconColor,
              size: 30,
            ),
          ),
          Container(
            child: widget.itemNumber == 0
                ? const Opacity(
                    opacity: 0,
                    child: Text("1"),
                  )
                : widget.itemNumber <= 9
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: widget.numberCircleColor,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: PrimaryColors.primaryOrange,
                          child: Center(
                            child: Text(
                              "${widget.itemNumber}",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        radius: 10,
                        backgroundColor: PrimaryColors.primaryBlue,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: PrimaryColors.primaryOrange,
                          child: Center(
                            child: Text(
                              ":D",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
