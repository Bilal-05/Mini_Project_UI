import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/DataBases/InCart.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  List ViewCart = [];
  List OriginalPrice = [];
  String text = 'Cart is Empty';
  @override
  void initState() {
    ViewCart = Cart.inCart;
    for (int i = 0; i < Cart.inCart.length; i++) {
      OriginalPrice.add(Cart.inCart[i]['itemUnit']);
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Cart.inCart.isEmpty
        ? Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: SecondaryColors.secondaryBlack00),
            ),
          )
        : Container(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 259,
                  child: ListView.builder(
                    itemCount: Cart.inCart.length,
                    itemBuilder: (context, index) {
                      return Cart.inCart[index]['Quantity'] >= 1 &&
                              index < 3 &&
                              index >= 0
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
                                                OriginalPrice[index] *
                                                    Cart.inCart[index]
                                                        ['Quantity'];
                                            if (Cart.inCart[index]
                                                    ['Quantity'] ==
                                                0) {
                                              Cart.inCart.removeAt(index);
                                              text = 'Cart is Empty';
                                            }
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
                                          setState(() {
                                            Cart.inCart[index]['Quantity'] =
                                                Cart.inCart[index]['Quantity'] +
                                                    1;
                                            Cart.inCart[index]['itemUnit'] =
                                                OriginalPrice[index] *
                                                    Cart.inCart[index]
                                                        ['Quantity'];
                                          });
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
              ],
            ),
          );
  }
}
