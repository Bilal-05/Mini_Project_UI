import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Constants/imagePath.dart';
import 'package:mini_project/Screens/CartView/CartView-Widget/cartview-appbar.dart';

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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: PrimaryColors.primaryYellow,
                  child: Center(child: Image.asset(ProductImages.Sale)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: const CartAppBar(),
                ),
              ],
            ),
            Text(
              'Hello',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
