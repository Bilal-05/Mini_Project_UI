import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/onboardingView/onboarding_view.dart';

import '../../Constants/imagePath.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // await Future.delayed();
    // TODO: implement initState
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const OnBoardingView();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors.primaryOrange,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Center(
              child: Image.asset(ProductImages.GoFresh),
            ),
          ),
        ),
      ),
    );
  }
}
