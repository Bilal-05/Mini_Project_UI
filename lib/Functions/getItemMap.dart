import '../DataBases/Product.dart';

class itemDetail {
  static List getItemDetails(String itemName) {
    List itemList = [];
    for (int i = 0; i < Products.items.length; i++) {
      if (Products.items[i]['itemName'] == itemName) {
        itemList.add(Products.items[i]);
      }
    }
    return itemList;
  }
}
