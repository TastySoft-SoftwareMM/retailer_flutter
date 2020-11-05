import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:retailer/style/theme.dart' as Style;

getToast(BuildContext context, String message) {
  return showToast(message,
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      startOffset: Offset(0.0, -3.0),
      reverseEndOffset: Offset(0.0, -3.0),
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn);
}


Widget getLoading(){
  return  WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
      ),
    )),
  );
}
