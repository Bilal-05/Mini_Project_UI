import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextColors.textColor1,
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: PrimaryColors.primary1,
      ),
    );
  }
}
