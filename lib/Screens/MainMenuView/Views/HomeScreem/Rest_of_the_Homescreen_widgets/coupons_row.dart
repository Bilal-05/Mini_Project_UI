import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> couponColor = [
      PrimaryColors.primaryOrange,
      PrimaryColors.primaryYellow
    ];

    List<String> percentValue = ["50", "25"];

    List<String> orderNo = ["3", "2"];

    return InkWell(
      onTap: () {},
      child: Container(
        height: 180,
        color: Colors.white,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: percentValue.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: couponColor[index],
              ),
              height: 123,
              width: 300,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.images,
                            size: 100,
                            color: TextColors.textColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Get",
                        style: TextStyle(
                            color: TextColors.textColor1,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${percentValue[index]}% OFF",
                        style: const TextStyle(
                            color: TextColors.textColor1,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "on first ${orderNo[index]} orders",
                        style: const TextStyle(
                            color: TextColors.textColor1,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
