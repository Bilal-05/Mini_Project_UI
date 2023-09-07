import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';

class PricingRow extends StatelessWidget {
  final List ItemDetails;
  const PricingRow({super.key, required this.ItemDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$${ItemDetails[0]['itemUnit']}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: PrimaryColors.primaryBlue,
                    ),
                  ),
                  const TextSpan(
                    text: '/Per-Unit',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: PrimaryColors.primaryBlue),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 24,
          width: 84,
          decoration: BoxDecoration(
            color: PrimaryColors.primaryBlue,
            borderRadius: BorderRadius.circular(70),
          ),
          child: const Center(
            child: Text(
              '\$2.00 OFF',
              style: TextStyle(
                  color: TextColors.textColor1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const Spacer(),
        Text(
          'Reg. \$${ItemDetails[0]['itemUnit'] + 2} USD',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: TextColors.textColor2),
        )
      ],
    );
  }
}
