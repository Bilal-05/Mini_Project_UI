import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/widget/FirstContainer_widgets/firstContainer_Combined.dart';
import 'package:mini_project/Screens/MainMenuView/widget/Rest_of_the_screen_widgets/coupons.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: const SingleChildScrollView(
            child: Column(
              children: [
                FirstContainer(),
                Coupons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
