import '../DataBases/Product.dart';

class FilteredList {
  static List getFilteredList(String categoryName, String tag) {
    List filteredList = [];
    for (int i = 0; i < Products.items.length; i++) {
      if (Products.items[i]['Category'] == categoryName) {
        for (int j = 0; j < Products.items[i]['Tags'].length; j++) {
          if (Products.items[i]['Tags'][j] == tag) {
            filteredList.add(Products.items[i]);
          }
        }
      }
    }
    return filteredList;
  }
}
