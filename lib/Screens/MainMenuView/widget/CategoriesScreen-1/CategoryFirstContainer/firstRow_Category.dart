import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
//import 'package:mini_project/DataBases/InCart.dart';

class FirstCategoryRow extends StatefulWidget {
  final int itemNumber;
  const FirstCategoryRow({super.key, required this.itemNumber});

  @override
  State<FirstCategoryRow> createState() => _FirstCategoryRowState();
}

class _FirstCategoryRowState extends State<FirstCategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Hello, Bilal",
          style: TextStyle(
              color: TextColors.textColor1,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            color: TextColors.textColor1,
            size: 30,
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: TextColors.textColor1,
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
                          backgroundColor: PrimaryColors.primary1,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: PrimaryColors.primary3,
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
                          backgroundColor: PrimaryColors.primary1,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: PrimaryColors.primary3,
                            child: Center(
                              child: Text(
                                ":D",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ],
    );
  }
}
