import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: PrimaryColors.primaryBlue, width: 2),
            backgroundColor: TextColors.textColor1,
            fixedSize: const Size(143, 56),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Add To Cart",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Manrope",
              fontWeight: FontWeight.w600,
              color: PrimaryColors.primaryBlue,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: PrimaryColors.primaryBlue,
            fixedSize: const Size(143, 56),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Buy Now",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Manrope",
              fontWeight: FontWeight.w600,
              color: TextColors.textColor1,
            ),
          ),
        ),
      ],
    );
  }
}
