import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
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
