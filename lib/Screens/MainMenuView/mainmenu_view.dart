import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: PrimaryColors.primary1,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 40),
                    child: Row(
                      children: [
                        Text(
                          "Hello, Bilal",
                          style: TextStyle(
                              color: TextColors.textColor1,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
