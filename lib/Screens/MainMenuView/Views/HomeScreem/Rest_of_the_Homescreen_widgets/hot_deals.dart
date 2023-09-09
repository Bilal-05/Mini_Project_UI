import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/addToCart.dart';
import 'package:mini_project/Functions/getList.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetail_view.dart';

class HotDeals extends StatefulWidget {
  final List cart;
  const HotDeals({
    super.key,
    required this.cart,
  });

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  List HotDeal = [];
  @override
  void initState() {
    HotDeal = FetchList.getList('HotDeal');
    // print(HotDeal);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hot Deals",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: TextColors.textColor3),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 240,
            color: Colors.white,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: HotDeal.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailView(
                                itemName: HotDeal[index]['itemName']);
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 210,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: TextColors.textColor1,
                        border: Border.all(
                          width: 0.5,
                          color: TextColors.textColor2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 100,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  "${HotDeal[index]['itemImage']}",
                                  height: 100,
                                  width: 120,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 2,
                              width: 150,
                              decoration: BoxDecoration(
                                color: SecondaryColors.secondaryGrey01,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    HotDeal[index]['itemName'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 2, bottom: 5),
                                  child: Text(
                                    HotDeal[index]['Tagline'],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 46,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
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
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Unit',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        TextColors.textColor3,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '  \$${HotDeal[index]["itemUnit"]}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: "hotbtn$index",
                                        onPressed: () {
                                          AddToCart.addToCart(
                                              HotDeal[index]['itemName']);
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
