// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';
import 'package:mini_project/Screens/MainMenuView/Views/CategoriesScreen-1/categories_view.dart';
import 'package:mini_project/Screens/MainMenuView/Views/HomeScreem/HomeScreen_View.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  int index = 0;

  final screen = const [HomeView(), CategoryView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: TextColors.textColor2,
          indicatorColor: TextColors.textColor2,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            //home
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home_filled,
                color: PrimaryColors.primary4,
              ),
              label: "Home",
            ),
            //category
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              selectedIcon: Icon(
                Icons.category,
                color: PrimaryColors.primary4,
              ),
              label: "Category",
            ),
            //favorites
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(
                Icons.favorite,
                color: PrimaryColors.primary4,
              ),
              label: "Favorites",
            ),
            //setting
            NavigationDestination(
              icon: Icon(Icons.more_vert_outlined),
              selectedIcon: Icon(
                Icons.more_vert,
                color: PrimaryColors.primary4,
              ),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}

// class MainMenuView extends StatefulWidget {
//   const MainMenuView({super.key});

//   @override
//   State<MainMenuView> createState() => _MainMenuViewState();
// }

// class _MainMenuViewState extends State<MainMenuView> {
//   var currentPage = 0;
//   final _controller = NotchBottomBarController(index: 0);
//   final _pageController = PageController(initialPage: 0);

//   List Page = const [
//     HomeView(),
//     CategoriesView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Page[currentPage],
//       extendBody: true,
//       bottomNavigationBar: AnimatedNotchBottomBar(
//         showShadow: false,
//         removeMargins: true,
//         notchBottomBarController: _controller,
//         durationInMilliSeconds: 300,
//         showLabel: true,
//         itemLabelStyle: const TextStyle(
//             color: Colors.black,
//             fontSize: 12.0,
//             fontFamily: 'Manrope',
//             fontWeight: FontWeight.w500),
//         notchColor: TextColors.textColor1,
//         onTap: (index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         bottomBarItems: const [
//           //Home Screen
//           BottomBarItem(
//             inActiveItem: Icon(Icons.home_outlined),
//             activeItem: Icon(
//               Icons.home_filled,
//               color: PrimaryColors.primary4,
//             ),
//             itemLabel: 'Home',
//           ),
//           //Category Screen
//           BottomBarItem(
//             inActiveItem: Icon(Icons.category_outlined),
//             activeItem: Icon(
//               Icons.category,
//               color: PrimaryColors.primary4,
//             ),
//             itemLabel: 'Category',
//           ),
//         ],
//       ),
//     );
//   }
// }
