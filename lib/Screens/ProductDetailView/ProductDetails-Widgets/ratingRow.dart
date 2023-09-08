import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mini_project/Constants/colors.dart';

class RatingRow extends StatelessWidget {
  final List ItemDetails;
  const RatingRow({super.key, required this.ItemDetails});

  @override
  Widget build(BuildContext context) {
    int Reviews = 110;
    return Row(
      children: [
        RatingBar.builder(
          initialRating: (ItemDetails[0]["starRating"].toDouble()),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          tapOnlyMode: false,
          updateOnDrag: false,
          itemPadding: const EdgeInsets.all(0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: PrimaryColors.primaryYellow,
            size: 10,
          ),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "$Reviews Reviews",
          style: const TextStyle(
              color: Color(0xffA1A1AB),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
