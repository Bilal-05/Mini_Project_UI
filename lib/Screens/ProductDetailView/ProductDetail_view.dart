import 'package:flutter/material.dart';
import 'package:mini_project/Functions/getItemMap.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/Appbar_ProductDetails.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/Details.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/NutritionalFact.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/Reviews.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/buttons.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/pricingRow.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/ratingRow.dart';

import '../../Constants/colors.dart';
import '../../DataBases/FavoriteItem.dart';
import '../../DataBases/Product.dart';

class ProductDetailView extends StatefulWidget {
  final String itemName;
  const ProductDetailView({super.key, required this.itemName});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  List ItemDetails = [];
  bool isSelected = false;
  Map item = {};

  @override
  void initState() {
    setState(() {
      ItemDetails = itemDetail.getItemDetails(widget.itemName);
      // print(ItemDetails);
    });

    // isSelected = FavFunction.isFav(ItemDetails[0]);
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
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: DetailsAppBar(itemName: widget.itemName),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Center(
                    child: Container(
                      child: Container(
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image.asset(
                            ItemDetails[0]['itemImage'],
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          if (ItemDetails[0]['isFav'] == true) {
                            for (int i = 0; i < Products.items.length; i++) {
                              if (ItemDetails[0]['itemName'] ==
                                  Products.items[i]['itemName']) {
                                Products.items[i]['isFav'] = false;
                                isSelected = false;
                              }
                            }

                            for (int i = 0; i < Favorite.Fav.length; i++) {
                              if (Favorite.Fav[i]['itemName'] ==
                                  ItemDetails[0]['itemName']) {
                                Favorite.Fav.removeAt(i);
                                print(Favorite.Fav);
                              }
                            }
                          } else {
                            for (int i = 0; i < Products.items.length; i++) {
                              if (ItemDetails[0]['itemName'] ==
                                  Products.items[i]['itemName']) {
                                Products.items[i]['isFav'] = true;
                                isSelected = true;
                              }
                            }
                            item['itemName'] = ItemDetails[0]['itemName'];
                            item['itemUnit'] = ItemDetails[0]['itemUnit'];
                            item['itemImage'] = ItemDetails[0]['itemImage'];
                            item['itemFav'] = ItemDetails[0]['isFav'];
                            Favorite.Fav.add(item);
                            print(Favorite.Fav);
                          }
                        },
                      );
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: ItemDetails[0]['isFav'] == true
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(
                  ItemDetails[0]['itemName'],
                  style: const TextStyle(
                    color: TextColors.textColor3,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: PricingRow(ItemDetails: ItemDetails),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 10, 0),
                child: RatingRow(ItemDetails: ItemDetails),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 10, 0),
                child: ProductDetails(ItemDetails: ItemDetails),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 10, 0),
                child: NutritionalFact(ItemDetails: ItemDetails),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                width: 370,
                height: 3,
                decoration: BoxDecoration(
                    color: TextColors.textColor2,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Reviews(ItemDetails: ItemDetails),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: RoundButton(
                  itemName: ItemDetails[0]['itemName'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
