import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_project/Constants/imagePath.dart';

import '../../Constants/colors.dart';
import '../../DataBases/InCart.dart';
import '../../widgets/customAppbar.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  var randomNumber = Random().nextInt(10000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: TextColors.textColor1,
              //AppBar
              margin: const EdgeInsets.fromLTRB(15, 10, 10, 20),
              child: const CustomAppBar(
                screenName: 'Orders',
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: Cart.inCart.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: TextColors.textColor2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
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
                                fontWeight: FontWeight.w700,
                                color: TextColors.textColor4),
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'ID:  ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: TextColors.textColor4,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '#$randomNumber',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: TextColors.textColor3),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Quantity ${Cart.inCart[index]['Quantity']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: TextColors.textColor4),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: TextColors.textColor1,
              height: 200,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 175,
                          height: 175,
                          child: Image.asset(ProductImages.track),
                        ),
                        const Text(
                          'Meet our rider, Rakib',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: TextColors.textColor4),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your Order',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: TextColors.textColor3),
                        ),
                        const Text(
                          'is on the way',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: TextColors.textColor3),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: PrimaryColors.primaryBlue,
                              fixedSize: const Size(115, 56),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Track Order',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: TextColors.textColor1),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
