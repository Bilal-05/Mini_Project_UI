import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/getfilteredList.dart';
import 'package:mini_project/Screens/ProductView/ProductView_widgets/itemCard.dart';
import 'package:mini_project/Screens/ProductView/ProductView_widgets/productAppBar.dart';

class ProductView extends StatefulWidget {
  final int pageNo;
  final String categoryName;
  const ProductView(
      {super.key, required this.pageNo, required this.categoryName});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with TickerProviderStateMixin {
  List TagList = [
    {
      'Category': 'Ha',
      'tags': ['ha', 'ha']
    }
  ];
  String? tag;
  @override
  void initState() {
    tag = 'Popular';
    TagList = FilteredList.getFilteredList(widget.categoryName, tag!);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ProductAppBar(
                  categoryName: widget.categoryName,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      // Popular for All
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: (tag == 'Popular')
                                    ? PrimaryColors.primaryOrange
                                    : SecondaryColors.secondaryGrey02,
                                width: 1)),
                        label: SizedBox(
                          width: 80,
                          height: 30,
                          child: Center(
                              child: Text(
                            'Popular',
                            style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                color: (tag == 'Popular')
                                    ? TextColors.textColor1
                                    : SecondaryColors.secondaryGrey02,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        selected: (tag == 'Popular') ? true : false,
                        selectedColor: PrimaryColors.primaryOrange,
                        backgroundColor: Colors.transparent,
                        onSelected: (value) {
                          setState(() {
                            tag = 'Popular';
                            TagList = FilteredList.getFilteredList(
                                widget.categoryName, tag!);
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // low Price for all
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: (tag == 'Low Price')
                                    ? PrimaryColors.primaryOrange
                                    : SecondaryColors.secondaryGrey02,
                                width: 1)),
                        label: SizedBox(
                          width: 80,
                          height: 30,
                          child: Center(
                              child: Text(
                            'Low Price',
                            style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                color: (tag == 'Low Price')
                                    ? TextColors.textColor1
                                    : SecondaryColors.secondaryGrey02,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        selected: (tag == 'Low Price') ? true : false,
                        selectedColor: PrimaryColors.primaryOrange,
                        backgroundColor: Colors.transparent,
                        onSelected: (value) {
                          setState(() {
                            tag = 'Low Price';
                            TagList = FilteredList.getFilteredList(
                                widget.categoryName, tag!);
                          });
                        },
                      ),
                      widget.categoryName == 'Fish'
                          ? const SizedBox(
                              width: 10,
                            )
                          : Container(),
                      // Big Fishes only for Fish Category
                      widget.categoryName == 'Fish'
                          ? ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      color: (tag == 'Big Fishes')
                                          ? PrimaryColors.primaryOrange
                                          : SecondaryColors.secondaryGrey02,
                                      width: 1)),
                              label: SizedBox(
                                width: 80,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  'Big Fishes',
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      color: (tag == 'Big Fishes')
                                          ? TextColors.textColor1
                                          : SecondaryColors.secondaryGrey02,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              selected: (tag == 'Big Fishes') ? true : false,
                              selectedColor: PrimaryColors.primaryOrange,
                              backgroundColor: Colors.transparent,
                              onSelected: (value) {
                                setState(() {
                                  tag = 'Big Fishes';
                                  TagList = FilteredList.getFilteredList(
                                      widget.categoryName, tag!);
                                });
                              },
                            )
                          : Container(),
                      widget.categoryName == 'Fish'
                          ? const SizedBox(
                              width: 10,
                            )
                          : Container(),

                      widget.categoryName == 'Fish'
                          ? ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      color: (tag == 'Small Fishes')
                                          ? PrimaryColors.primaryOrange
                                          : SecondaryColors.secondaryGrey02,
                                      width: 1)),
                              label: SizedBox(
                                width: 80,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  'Small Fishes',
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      color: (tag == 'Small Fishes')
                                          ? TextColors.textColor1
                                          : SecondaryColors.secondaryGrey02,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              selected: (tag == 'Small Fishes') ? true : false,
                              selectedColor: PrimaryColors.primaryOrange,
                              backgroundColor: Colors.transparent,
                              onSelected: (value) {
                                setState(() {
                                  tag = 'Small Fishes';
                                  TagList = FilteredList.getFilteredList(
                                      widget.categoryName, tag!);
                                });
                              },
                            )
                          : Container(),
                      widget.categoryName == 'Beef' ||
                              widget.categoryName == 'Chicken'
                          ? const SizedBox(
                              width: 10,
                            )
                          : Container(),
                      widget.categoryName == 'Beef' ||
                              widget.categoryName == 'Chicken'
                          ? ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      color: (tag == 'BBQ')
                                          ? PrimaryColors.primaryOrange
                                          : SecondaryColors.secondaryGrey02,
                                      width: 1)),
                              label: SizedBox(
                                width: 80,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  'BBQ',
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      color: (tag == 'BBQ')
                                          ? TextColors.textColor1
                                          : SecondaryColors.secondaryGrey02,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              selected: (tag == 'BBQ') ? true : false,
                              selectedColor: PrimaryColors.primaryOrange,
                              backgroundColor: Colors.transparent,
                              onSelected: (value) {
                                setState(() {
                                  tag = 'BBQ';
                                  TagList = FilteredList.getFilteredList(
                                      widget.categoryName, tag!);
                                });
                              },
                            )
                          : Container(),

                      widget.categoryName == 'Fruits' ||
                              widget.categoryName == 'Vegetables'
                          ? const SizedBox(
                              width: 10,
                            )
                          : Container(),
                      widget.categoryName == 'Fruits' ||
                              widget.categoryName == 'Vegetables'
                          ? ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                      color: (tag == 'Fresh')
                                          ? PrimaryColors.primaryOrange
                                          : SecondaryColors.secondaryGrey02,
                                      width: 1)),
                              label: SizedBox(
                                width: 80,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  'Fresh',
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      color: (tag == 'Fresh')
                                          ? TextColors.textColor1
                                          : SecondaryColors.secondaryGrey02,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              selected: (tag == 'Fresh') ? true : false,
                              selectedColor: PrimaryColors.primaryOrange,
                              backgroundColor: Colors.transparent,
                              onSelected: (value) {
                                setState(() {
                                  tag = 'Fresh';
                                  TagList = FilteredList.getFilteredList(
                                      widget.categoryName, tag!);
                                });
                              },
                            )
                          : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: (tag == 'Free Delivery')
                                    ? PrimaryColors.primaryOrange
                                    : SecondaryColors.secondaryGrey02,
                                width: 1)),
                        label: SizedBox(
                          width: 90,
                          height: 30,
                          child: Center(
                              child: Text(
                            'Free Delivery',
                            style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                color: (tag == 'Free Delivery')
                                    ? TextColors.textColor1
                                    : SecondaryColors.secondaryGrey02,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        selected: (tag == 'Free Delivery') ? true : false,
                        selectedColor: PrimaryColors.primaryOrange,
                        backgroundColor: Colors.transparent,
                        onSelected: (value) {
                          setState(() {
                            tag = 'Free Delivery';
                            TagList = FilteredList.getFilteredList(
                                widget.categoryName, tag!);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: TagList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(5),
                          child: ProductCard(
                            TagList: TagList[index],
                            Index: index,
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
