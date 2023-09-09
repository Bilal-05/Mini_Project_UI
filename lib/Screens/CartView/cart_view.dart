import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Constants/imagePath.dart';
import 'package:mini_project/Screens/CartView/CartView-Widget/cartview-appbar.dart';
import 'package:mini_project/Screens/CartView/CartView-Widget/itemListing.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // 25% Image
                    color: PrimaryColors.primaryYellow,
                    child: Center(child: Image.asset(ProductImages.Sale)),
                  ),
                  Container(
                    //AppBar
                    margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                    child: const CartAppBar(),
                  ),
                ],
              ),
              const CustomListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
