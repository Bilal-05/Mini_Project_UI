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

class ProductDetailView extends StatefulWidget {
  final String itemName;
  const ProductDetailView({super.key, required this.itemName});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  List ItemDetails = [];

  @override
  void initState() {
    ItemDetails = itemDetail.getItemDetails(widget.itemName);
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
