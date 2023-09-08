import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/reviewTile.dart';

class Reviews extends StatefulWidget {
  final List ItemDetails;
  const Reviews({super.key, required this.ItemDetails});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool ShowReview = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Review',
                  style: TextStyle(
                      color: TextColors.textColor3,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 10,
                ),
                (!ShowReview)
                    ? IconButton(
                        onPressed: () {
                          setState(
                            () {
                              ShowReview = true;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(
                            () {
                              ShowReview = false;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          size: 30,
                        ),
                      )
              ],
            ),
            (ShowReview)
                ? Container(
                    width: 360,
                    height: 150,
                    child: ReviewTile(
                      ItemReview: widget.ItemDetails[0]['itemReview'],
                    ))
                : Container(),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: SecondaryColors.secondaryGrey00.withOpacity(0.8),
            ),
          ],
        ),
      ],
    );
  }
}
