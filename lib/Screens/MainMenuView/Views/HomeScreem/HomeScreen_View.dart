import 'package:flutter/material.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'Rest_of_the_Homescreen_widgets/hot_deals.dart';
import 'HomeFirstContainer_widgets/firstContainer_Combined.dart';
import 'Rest_of_the_Homescreen_widgets/coupons_row.dart';
import 'Rest_of_the_Homescreen_widgets/recommended_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FirstContainer(),
              const Coupons(),
              const SizedBox(
                height: 10,
              ),
              Recommended(
                cart: Cart.inCart,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: HotDeals(
                  cart: Cart.inCart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
