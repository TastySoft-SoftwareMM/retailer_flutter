import 'package:flutter/material.dart';
import 'package:retailer/screens/main/main-screen.dart';
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
