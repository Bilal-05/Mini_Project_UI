import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
import 'package:mini_project/Screens/cartView/cart_view.dart';
import 'package:page_transition/page_transition.dart';

import '../Constants/colors.dart';

class CartIcon extends StatefulWidget {
  final Color numberCircleColor;
  final Color iconColor;
  final int itemNumber;
  const CartIcon(
      {super.key,
      required this.itemNumber,
      required this.iconColor,
      required this.numberCircleColor});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.topToBottom,
                    child: CartView(),
                  ),
                );
                setState(() {
                  widget.itemNumber == GetItemNumber.getItemNumber();
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.bagShopping,
                color: widget.iconColor,
                size: 25,
              ),
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
