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
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              height: 60,
              child: Row(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            ItemReview[index]['reviewerName'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: TextColors.textColor3),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            ItemReview[index]['review'],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: TextColors.textColor2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: RatingBar.builder(
                      initialRating:
                          (ItemReview[index]["starRating"].toDouble()),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      tapOnlyMode: false,
                      updateOnDrag: false,
                      itemPadding: const EdgeInsets.all(4),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: PrimaryColors.primaryYellow,
                        size: 10,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
