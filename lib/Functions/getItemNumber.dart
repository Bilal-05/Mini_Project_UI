import '../DataBases/InCart.dart';

class GetItemNumber {
  static int getItemNumber() {
    return Cart.inCart.length;
  }
}
