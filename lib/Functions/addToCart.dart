import 'package:mini_project/DataBases/InCart.dart';
import 'package:mini_project/Functions/getItemMap.dart';

class AddToCart {
  static addToCart(String itemName) {
    Map ToAdd = {};
    bool alreadyInCart = false;
    List ItemDetails = [];
    int Quantity = 1;
    int OriginalPrice = 0;

    ItemDetails = itemDetail.getItemDetails(itemName);
    OriginalPrice = ItemDetails[0]['itemUnit'];

    for (int i = 0; i < Cart.inCart.length; i++) {
      if (Cart.inCart[i]['itemName'] == itemName) {
        alreadyInCart = true;
      }
    }

    if (!alreadyInCart) {
      ToAdd['itemName'] = ItemDetails[0]['itemName'];
      ToAdd['Quantity'] = Quantity;
      ToAdd['itemUnit'] = ItemDetails[0]['itemUnit'];
      ToAdd['itemImage'] = ItemDetails[0]['itemImage'];
      Cart.inCart.add(ToAdd);
      print(Cart.inCart);
    } else {
      for (int i = 0; i < Cart.inCart.length; i++) {
        if (Cart.inCart[i]['itemName'] == itemName) {
          Cart.inCart[i]['Quantity'] = Cart.inCart[i]['Quantity'] + 1;
          Cart.inCart[i]['itemUnit'] =
              OriginalPrice * Cart.inCart[i]['Quantity'];
        }
      }
    }
  }
}
