import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class CartBackButton extends StatelessWidget {
  const CartBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName('/firstscreen'));
      },
      icon: const Center(
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 20,
          color: TextColors.textColor3,
        ),
      ),
    );
  }
}
