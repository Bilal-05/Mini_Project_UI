import '../DataBases/Product.dart';

class FetchList {
  static List getList(String tag) {
    List list = [];
    for (int i = 0; i < Products.items.length; i++) {
      for (int j = 0; j < Products.items[i]['Tags'].length; j++) {
        if (Products.items[i]['Tags'][j] == tag) {
          list.add(Products.items[i]);
        }
      }
    }
    return list;
  }
}
