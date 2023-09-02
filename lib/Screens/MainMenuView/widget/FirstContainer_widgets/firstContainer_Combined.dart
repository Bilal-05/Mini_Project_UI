import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'firstRow_Info.dart';
import 'secondRow_Info.dart';
import 'thirdRow_Info.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({super.key});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: PrimaryColors.primary1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: FirstRow(itemNumber: Cart.inCart.length),
          ),
          const SecondRow(),
          const ThirdRow()
        ],
      ),
    );
  }
}
