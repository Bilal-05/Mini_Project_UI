import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';

class NutritionalFact extends StatefulWidget {
  final List ItemDetails;
  const NutritionalFact({super.key, required this.ItemDetails});

  @override
  State<NutritionalFact> createState() => _NutritionalFactState();
}

class _NutritionalFactState extends State<NutritionalFact> {
  bool ShowDesc = false;

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
                  'Nutritional Facts',
                  style: TextStyle(
                      color: TextColors.textColor3,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 10,
                ),
                (!ShowDesc)
                    ? IconButton(
                        onPressed: () {
                          setState(
                            () {
                              ShowDesc = true;
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
                              ShowDesc = false;
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
            (ShowDesc)
                ? Container(
                    width: 360,
                    height: 72,
                    child: Text(
                      widget.ItemDetails[0]['nurtrionalFact'],
                      style: const TextStyle(
                          color: TextColors.textColor2,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
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
