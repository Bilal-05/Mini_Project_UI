import 'package:flutter/material.dart';
import 'package:mini_project/Functions/getItemMap.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetails-Widgets/Appbar_ProductDetails.dart';

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
    print(ItemDetails);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [DetailsAppBar(itemName: widget.itemName)],
        ),
      ),
    );
  }
}
