import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/DataBases/InCart.dart';
import 'package:mini_project/Functions/getSubtotal.dart';
import 'package:mini_project/Screens/cartView/CartView-Widget/seeMore.dart';
import 'package:mini_project/Screens/checkoutView/checkout_view.dart';
import 'package:page_transition/page_transition.dart';

import '../../../DataBases/Product.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  TextStyle Pricing = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: TextColors.textColor3);

  TextStyle Total = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: TextColors.textColor3);

  TextStyle PricingTitle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: TextColors.textColor4);

  List OriginalPrice = [];
  int subTotal = 0;
  String text = 'Cart is Empty';

  void getOriginalPrice() {
    OriginalPrice = [];
    for (int i = 0; i < Cart.inCart.length; i++) {
      for (int j = 0; j < Products.items.length; j++) {
        if (Cart.inCart[i]['itemName'] == Products.items[j]["itemName"]) {
          OriginalPrice.add(Products.items[j]['itemUnit']);
        }
      }
    }
  }

  @override
  void initState() {
    getOriginalPrice();
    print(OriginalPrice);
    subTotal = SubTotal.getSubTotal();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Cart.inCart.isEmpty
        ? Container(
            height: 500,
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: SecondaryColors.secondaryBlack00),
              ),
            ),
          )
        : Container(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 240,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Cart.inCart.length,
                    itemBuilder: (context, index) {
                      return Cart.inCart[index]['Quantity'] >= 1 &&
                              index < 3 &&
                              index >= 0 &&
                              Cart.inCart.isNotEmpty
                          ? Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  child: Image.asset(
                                    Cart.inCart[index]['itemImage'],
                                  ),
                                ),
                                title: Text(
                                  Cart.inCart[index]['itemName'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: TextColors.textColor3),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "\$ ${Cart.inCart[index]['itemUnit']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: TextColors.textColor3),
                                  ),
                                ),
                                trailing: Container(
                                  width: 170,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FloatingActionButton.small(
                                        heroTag:
                                            '${Cart.inCart[index]['itemName']}-$index',
                                        backgroundColor: TextColors.textColor2,
                                        onPressed: () {
                                          setState(() {
                                            Cart.inCart[index]['Quantity'] =
                                                Cart.inCart[index]['Quantity'] -
                                                    1;
                                            Cart.inCart[index]['itemUnit'] =
                                                Cart.inCart[index]['itemUnit'] -
                                                    OriginalPrice[index];

                                            if (Cart.inCart[index]
                                                    ['Quantity'] ==
                                                0) {
                                              OriginalPrice.removeAt(index);
                                              print(OriginalPrice);
                                              Cart.inCart.removeAt(index);
                                              text = 'Cart is Empty';
                                            }

                                            subTotal = SubTotal.getSubTotal();
                                          });
                                        },
                                        child: FaIcon(FontAwesomeIcons.minus),
                                      ),
                                      Text(
                                        Cart.inCart[index]['Quantity']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: TextColors.textColor3),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag:
                                            '${Cart.inCart[index]['itemName']}+$index',
                                        backgroundColor: TextColors.textColor2,
                                        onPressed: () {
                                          setState(
                                            () {
                                              Cart.inCart[index]['Quantity'] =
                                                  Cart.inCart[index]
                                                          ['Quantity'] +
                                                      1;
                                              Cart.inCart[index]['itemUnit'] =
                                                  Cart.inCart[index]
                                                          ['itemUnit'] +
                                                      OriginalPrice[index];
                                              subTotal = SubTotal.getSubTotal();
                                            },
                                          );
                                        },
                                        child: FaIcon(FontAwesomeIcons.plus),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                ),
                Cart.inCart.length > 3
                    ? InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: SeeMore(),
                                );
                              },
                            ),
                          );
                          setState(() {
                            print(OriginalPrice);
                            getOriginalPrice();
                            print(OriginalPrice);
                            subTotal = SubTotal.getSubTotal();
                          });
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "+${Cart.inCart.length - 3} More",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: PrimaryColors.primaryBlue),
                          ),
                        ),
                      )
                    : Container(),
                Cart.inCart.length >= 1
                    ? Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: TextColors.textColor1.withOpacity(1),
                            border: Border.all(
                                width: 0.5, color: TextColors.textColor2),
                            boxShadow: const [
                              BoxShadow(
                                color: TextColors.textColor2,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: .5,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(top: 20, bottom: 5),
                          height: MediaQuery.of(context).size.height * 0.28,
                          width: 359,
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Subtotal', style: PricingTitle),
                                      Text('\$$subTotal', style: Pricing)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Delivery Fee', style: PricingTitle),
                                      Text('\$2', style: Pricing)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total', style: PricingTitle),
                                      Text('\$${subTotal + 2}', style: Total)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            PrimaryColors.primaryBlue,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        fixedSize: Size(327, 56)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          curve: Curves.linear,
                                          type: PageTransitionType.rightToLeft,
                                          child: const CheckOutView(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed To checkout",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          );
  }
}
