import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/DataBases/Product.dart';
import 'package:mini_project/Screens/ProductDetailView/ProductDetail_view.dart';

import '../../../../../DataBases/FavoriteItem.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  bool isSelected = false;

  TextStyle fav = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w700, color: TextColors.textColor3);
  TextStyle itemNames = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: TextColors.textColor3);
  TextStyle itemTag = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, color: TextColors.textColor4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColors.primaryBlue,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Items (${Favorite.Fav.length})',
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: TextColors.textColor1),
        ),
      ),
      body: SizedBox(
        // height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                              onTap: () async {
                                await Navigator.push(
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
                                setState(() {});
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, bottom: 15),
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
                                      height: 100,
                                      width: 100,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Favorite.Fav[index]['itemName'],
                                            style: itemNames,
                                          ),
                                          Text(
                                            "\$${Favorite.Fav[index]['itemUnit']}",
                                            style: itemTag,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            for (int i = 0;
                                                i < Products.items.length;
                                                i++) {
                                              if (Favorite.Fav[index]
                                                      ['itemName'] ==
                                                  Products.items[i]
                                                      ['itemName']) {
                                                Products.items[i]['isFav'] =
                                                    false;
                                                Favorite.Fav.removeAt(index);
                                                break;
                                              }
                                            }
                                          });
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
                : SizedBox(
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
