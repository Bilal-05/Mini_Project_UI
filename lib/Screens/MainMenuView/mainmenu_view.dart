import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/widget/FirstContainer_widgets/firstContainer_Combined.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FirstContainer(),
          ],
        ),
      ),
    );
  }
}
