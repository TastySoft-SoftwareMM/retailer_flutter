import 'package:flutter/material.dart';
import 'package:retailer/screens/main/main-screen.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import 'package:retailer/screens/mandatorytasks/inventorycheck.dart';
import 'package:retailer/screens/mandatorytasks/merchandizing.dart';
import 'package:retailer/screens/mandatorytasks/merchandizingEdit.dart';
import 'package:retailer/screens/mandatorytasks/orderList.dart';
import 'package:retailer/screens/mandatorytasks/orderplacement.dart';
import 'style/theme.dart' as Style;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Retailer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Style.Colors.mainColor),
          primarySwatch: Colors.red,
          accentColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen());
  }
}
