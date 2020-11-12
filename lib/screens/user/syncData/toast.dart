import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:retailer/style/theme.dart' as Style;

var date = DateTime.now();
DateFormat dateFormat = DateFormat("yyyyMMdd");
String getDate = dateFormat.format(date);
getToast(BuildContext context, String message) {
  return showToast(message,
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      startOffset: Offset(0.0, -3.0),
      reverseEndOffset: Offset(0.0, -3.0),
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 2),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn);
}

final GlobalKey<State> _keyLoader = new GlobalKey<State>();
void loading(BuildContext context) {
  try {
    Dialogs.showLoadingDialog(context, _keyLoader);
  } catch (error) {
    print(error);
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  elevation: 0,
                  key: key,
                  backgroundColor: Colors.transparent,
                  children: <Widget>[
                    Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                    ))
                  ]));
        });
  }
}
