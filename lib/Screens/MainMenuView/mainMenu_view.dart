import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/MainMenuView/Views/FavoriteScreen/favorite_view.dart';
import 'package:mini_project/Screens/MainMenuView/Views/HomeScreem/HomeScreen_View.dart';
import 'package:mini_project/Screens/MainMenuView/Views/MoreScreen/More_view.dart';

import 'Views/CategoriesScreens/categories_view.dart';
// import 'package:mini_project/Screens/OnBoardingView/onboarding_view.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  //int index = 0; //for bottom navigation bar
  var currentPage = 0;
  final _controller = NotchBottomBarController(index: 0);
  final _pageController = PageController(initialPage: 0);
  List Page = const [HomeView(), CategoryView(), FavoriteView(), MoreView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        controller: _pageController,
        children: List.generate(Page.length, (index) => Page[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        showShadow: false,
        removeMargins: true,
        notchBottomBarController: _controller,
        durationInMilliSeconds: 300,
        showLabel: true,
        itemLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500),
        notchColor: TextColors.textColor3.withOpacity(0.8),
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            currentPage = index;
          });
        },
        bottomBarItems: [
          //Home Screen
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/navbar/homeUnselected.svg",
            ),
            activeItem: SvgPicture.asset(
              "assets/navbar/homeSelected.svg",
            ),
            itemLabel: 'Home',
          ),
          //Category Screen
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/navbar/CategoryUnselected.svg",
            ),
            activeItem: SvgPicture.asset(
              "assets/navbar/CategorySelected.svg",
            ),
            itemLabel: 'Category',
          ),
          //Favorite Screen
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/navbar/HeartUnselected.svg",
            ),
            activeItem: SvgPicture.asset(
              "assets/navbar/HeartSelected.svg",
            ),
            itemLabel: 'Favorite',
          ),
          //Category Screen
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/navbar/moreUnselected.svg",
            ),
            activeItem: SvgPicture.asset(
              "assets/navbar/moreSelected.svg",
            ),
            itemLabel: 'More',
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
