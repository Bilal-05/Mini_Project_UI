import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getItemNumber.dart';
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
      height: MediaQuery.of(context).size.height * 0.4,
      color: PrimaryColors.primaryBlue,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 52),
              child: FirstRow(
                itemNumber: GetItemNumber.getItemNumber(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const SecondRow(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const ThirdRow(),
            )
          ],
        ),
      ),
    );
  }
}
