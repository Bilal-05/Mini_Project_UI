import 'package:flutter/material.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'package:mini_project/DataBases/hot_deals.dart';
import 'package:mini_project/DataBases/recommendedItems.dart';
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
  List item = RecommendedItems.items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  items: RecommendedItems.items,
                  cart: Cart.inCart,
                ),
                const SizedBox(
                  height: 10,
                ),
                HotDeals(
                  items: HotDeal.items,
                  cart: Cart.inCart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
