import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mini_project/Constants/colors.dart';

class ReviewTile extends StatelessWidget {
  final List ItemReview;
  const ReviewTile({super.key, required this.ItemReview});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: ItemReview.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                ItemReview[index]['reviewerName'],
                style: const TextStyle(
                    color: TextColors.textColor3,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                ItemReview[index]['review'],
                style: const TextStyle(
                    color: TextColors.textColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              trailing: RatingBar.builder(
                initialRating: (ItemReview[index]["starRating"].toDouble()),
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
            );
          }),
    );
  }
}
