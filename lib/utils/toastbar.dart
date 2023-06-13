import 'package:fluttertoast/fluttertoast.dart';
import 'Colors.dart';

class ToastBar {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: colorsUsed.bcolor,
        textColor: colorsUsed.whiteTextcolor,
        fontSize: 16.0);
  }
}
