import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Constants/imagePath.dart';
import 'package:mini_project/Screens/cartView/CartView-Widget/itemListing.dart';

import '../../DataBases/InCart.dart';
import '../../widgets/customAppbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int length = 0;

  @override
  void initState() {
    setState(() {
      length = Cart.inCart.length;
    });
    // TODO: implement initState
    super.initState();
  }

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
                    height: MediaQuery.of(context).size.height * 0.30,
                    color: PrimaryColors.primaryYellow,
                    child: Center(child: Image.asset(ProductImages.Sale)),
                  ),
                  Container(
                    //AppBar
                    margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                    child: const CustomAppBar(
                      screenName: 'Shopping Cart',
                    ),
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
