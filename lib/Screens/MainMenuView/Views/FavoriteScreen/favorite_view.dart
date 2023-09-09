import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Functions/Fav.dart';
import 'package:mini_project/Functions/getItemMap.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetail_view.dart';

import '../../../../../DataBases/FavoriteItem.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List ItemDetails = [];
  bool isSelected = false;

  @override
  void initState() {
    if (Favorite.Fav.length == 1) {
      ItemDetails = itemDetail.getItemDetails(Favorite.Fav[0]['itemName']);
    } else if (Favorite.Fav.length > 1) {
      ItemDetails = itemDetail
          .getItemDetails(Favorite.Fav[Favorite.Fav.length - 1]['itemName']);
    }

    if (Favorite.Fav.isNotEmpty) {
      for (int i = 0; i < Favorite.Fav.length; i++) {
        if (Favorite.Fav[i]['itemName'] == ItemDetails[0]['itemName']) {
          isSelected = true;
        }
      }
    }
    // isSelected = FavFunction.isFav(ItemDetails[0]);
    // TODO: implement initState
    super.initState();
  }

  TextStyle fav = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w700, color: TextColors.textColor3);
  TextStyle itemNames = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: TextColors.textColor3);
  TextStyle itemTag = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, color: TextColors.textColor4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 110,
              color: PrimaryColors.primaryBlue,
              child: Center(
                child: Text(
                  'Favorite Items (${Favorite.Fav.length})',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: TextColors.textColor1),
                ),
              ),
            ),
            Favorite.Fav.isNotEmpty
                ? Expanded(
                    flex: 1,
                    child: Container(
                      height: 0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Favorite.Fav.length,
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: 'Fav$index',
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: ProductDetailView(
                                            itemName: Favorite.Fav[index]
                                                ['itemName']),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: TextColors.textColor1,
                                      child: Image.asset(
                                          Favorite.Fav[index]['itemImage']),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Favorite.Fav[index]['itemName'],
                                            style: itemNames,
                                          ),
                                          Text(
                                            Favorite.Fav[index]['Tagline'],
                                            style: itemTag,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: IconButton(
                                        onPressed: () {
                                          if (isSelected == true) {
                                            setState(
                                              () {
                                                FavFunction.removeFav(
                                                    ItemDetails[0], index);
                                                if (Favorite.Fav.length == 1) {
                                                  ItemDetails =
                                                      itemDetail.getItemDetails(
                                                          Favorite.Fav[0]
                                                              ['itemName']);
                                                } else if (Favorite.Fav.length >
                                                    1) {
                                                  ItemDetails =
                                                      itemDetail.getItemDetails(
                                                          Favorite.Fav[Favorite
                                                                  .Fav.length -
                                                              1]['itemName']);
                                                }

                                                // if (Favorite.Fav.isNotEmpty) {
                                                //   for (int i = 0;
                                                //       i < Favorite.Fav.length;
                                                //       i++) {
                                                //     if (Favorite.Fav[i]
                                                //             ['itemName'] ==
                                                //         ItemDetails[0]
                                                //             ['itemName']) {
                                                //       isSelected = true;
                                                //     }
                                                //   }
                                                // }
                                              },
                                            );
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text(
                        'Favorite is Empty',
                        style: fav,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
