import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/screens/user/login.dart';
import 'package:retailer/services/functional_provider.dart';
import 'style/theme.dart' as Style;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ViewModelFunction(),
      )
    ],
    child: MyApp(),
  ));
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
      home: Login(),
    );
  }
}
