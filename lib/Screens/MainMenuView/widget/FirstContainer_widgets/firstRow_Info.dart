import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/DataBases/InCart.dart';

class FirstRow extends StatefulWidget {
  final int itemNumber;
  const FirstRow({super.key, required this.itemNumber});

  @override
  State<FirstRow> createState() => _FirstRowState();
}

class _FirstRowState extends State<FirstRow> {
  int? itemNumber;

  void getItemNumber() {
    setState(() {
      itemNumber = Cart.inCart.length;
    });
  }

  @override
  void initState() {
    getItemNumber();
    // TODO: implement initState
    super.initState();
  }

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
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            const SizedBox(
              width: 28,
              child: FaIcon(
                FontAwesomeIcons.bagShopping,
                color: TextColors.textColor1,
                size: 24,
              ),
            ),
            Container(
              child: itemNumber == 0
                  ? const Opacity(
                      opacity: 0,
                      child: Text("1"),
                    )
                  : itemNumber! <= 9
                      ? CircleAvatar(
                          radius: 9,
                          backgroundColor: PrimaryColors.primary3,
                          child: Center(
                            child: Text(
                              "$itemNumber",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        )
                      : const CircleAvatar(
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
          ],
        ),
      ],
    );
  }
}
