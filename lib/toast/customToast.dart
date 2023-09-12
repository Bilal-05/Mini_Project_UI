import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_project/Constants/colors.dart';

class CustomToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: PrimaryColors.primaryDarkBlue,
      textColor: TextColors.textColor1,
      fontSize: 16.0,
    );
  }
}
