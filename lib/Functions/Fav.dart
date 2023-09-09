import 'package:mini_project/DataBases/FavoriteItem.dart';

class FavFunction {
  static addFav(Map itemDetails) {
    bool Continue = true;
    for (int i = 0; i < Favorite.Fav.length; i++) {
      if (Favorite.Fav[i]['itemName'] == itemDetails['itemName']) {
        Continue = false;
      }
    }

    if (!Continue) {
      print('Already Favorite');
    } else {
      Map Fav = {};
      Fav['itemName'] = itemDetails['itemName'];
      Fav['Tagline'] = itemDetails['Tagline'];
      Fav['itemImage'] = itemDetails['itemImage'];
      Favorite.Fav.add(Fav);
      print(Favorite.Fav);
    }
  }

  static removeFav(Map itemDetails, int index) {
    if (Favorite.Fav[index]['itemName'] == itemDetails['itemName']) {
      Favorite.Fav.removeAt(index);
    }
    print(Favorite.Fav);
  }
}
