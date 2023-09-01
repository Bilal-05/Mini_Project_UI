import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'package:mini_project/Screens/MainMenuView/widget/name_and_cart.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  TextEditingController HomeController = TextEditingController();
  late String text;
  @override
  void initState() {
    HomeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    HomeController.dispose();
    super.dispose();
  }

  void dropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: PrimaryColors.primary1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: FirstRow(itemNumber: Cart.inCart.length),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(
                              color: PrimaryColors.primary2, width: 3),
                        ),
                        icon: const Icon(Icons.search),
                      ),
                      controller: HomeController,
                      onSubmitted: (String value) {
                        setState(() {
                          text = HomeController.text;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const Column(
                          children: [
                            Opacity(
                              opacity: 0.50,
                              child: Text(
                                "DELIVERY TO",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: TextColors.textColor1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
