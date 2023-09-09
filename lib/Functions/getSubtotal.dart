import 'package:mini_project/DataBases/InCart.dart';

class SubTotal {
  static int getSubTotal() {
    int tempUnit = 0;
    int subTotal = 0;

    for (int i = 0; i < Cart.inCart.length; i++) {
      tempUnit = Cart.inCart[i]['itemUnit'];
      subTotal = subTotal + tempUnit;
    }

    return subTotal;
  }
}
