import 'package:flutter/material.dart';
import 'package:mini_project/Screens/MainMenuView/mainmenu_view.dart';
import 'package:mini_project/Screens/OnBoardingView/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingView(),
        '/firstscreen': (context) => const MainMenuView(),
      },
    );
  }
}