// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project/Constants/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<String> screenNo = ["One", "Two"];
  List<String> images = [
    "animations/shopping_phone.json",
    "animations/done_phone.json"
  ];
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: screenNo.length,
      itemBuilder: (BuildContext context, int index) {
        return Scaffold(
          backgroundColor: PrimaryColors.primary1,
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 0),
                    width: 300,
                    height: 203,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          "Your Holiday shopping delivered to Screen ${screenNo[index]}  🏕 ",
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Manrope",
                              color: TextColors.textColor1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 294,
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Text(
                        "There's something for everyone to enjoy with Sweet Shop Favourites Screen ${index + 1}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Manrope",
                            color: TextColors.textColor2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .10,
                  ),
                  Container(
                    child: currentpage == 0
                        ? row2()
                        : currentpage == 1
                            ? row1()
                            : const Text("data"),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Lottie.asset(images[index]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TextColors.textColor1,
                        fixedSize: const Size(260, 70),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/firstscreen');
                      },
                      child: const Text(
                        "Get Started →",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.w600,
                          color: TextColors.textColor3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onPageChanged: (index) {
        setState(() {
          currentpage = index;
        });
      },
    );
  }
}

Widget row1() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Opacity(
        opacity: 0.23,
        child: Container(
          decoration: BoxDecoration(
            color: SecondaryColors.secondary7,
            borderRadius: BorderRadius.circular(4),
          ),
          width: 24,
          height: 5,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          color: SecondaryColors.secondary7,
          borderRadius: BorderRadius.circular(4),
        ),
        width: 34,
        height: 5,
      ),
    ],
  );
}

Widget row2() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: BoxDecoration(
          color: SecondaryColors.secondary7,
          borderRadius: BorderRadius.circular(4),
        ),
        width: 34,
        height: 5,
      ),
      const SizedBox(
        width: 10,
      ),
      Opacity(
        opacity: 0.23,
        child: Container(
          decoration: BoxDecoration(
            color: SecondaryColors.secondary7,
            borderRadius: BorderRadius.circular(4),
          ),
          width: 24,
          height: 5,
        ),
      ),
    ],
  );
}
