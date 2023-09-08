import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Constants/imagePath.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'package:mini_project/Functions/getSubtotal.dart';
import 'package:mini_project/Screens/CartView/CartView-Widget/cartview-appbar.dart';
import 'package:mini_project/Screens/CartView/CartView-Widget/itemListing.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  TextStyle Pricing = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: TextColors.textColor3);

  TextStyle Total = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: TextColors.textColor3);

  TextStyle PricingTitle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: TextColors.textColor4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            Container(
              // margin: EdgeInsets.only(top: 20),
              height: 278.636,
              child: Cart.inCart.isNotEmpty
                  ? const CustomListTile()
                  : const Center(
                      child: Text(
                        'Cart is Empty',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: SecondaryColors.secondaryBlack00),
                      ),
                    ),
            ),
            // Cart.inCart.isEmpty
            //     ? Center(
            //         child: Container(
            //           margin: const EdgeInsets.only(top: 10, bottom: 5),
            //           color: TextColors.textColor2.withOpacity(1),
            //           height: 230,
            //           width: 350,
            //           child: Container(
            //             margin: const EdgeInsets.only(top: 20),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Container(
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 30, vertical: 10),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text('Subtotal', style: PricingTitle),
            //                       Text('\$', style: Pricing)
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 30, vertical: 10),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text('Delivery Fee', style: PricingTitle),
            //                       Text('\$2', style: Pricing)
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 30, vertical: 10),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text('Total', style: PricingTitle),
            //                       Text('\$35', style: Total)
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //     : Container()
          ],
        ),
      ),
    );
  }
}
