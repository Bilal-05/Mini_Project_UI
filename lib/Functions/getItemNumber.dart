// ignore_for_file: file_names

import '../DataBases/InCart.dart';

class GetItemNumber {
  static int getItemNumber() {
    return Cart.inCart.length;
  }
}
