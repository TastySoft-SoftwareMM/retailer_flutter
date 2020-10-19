import 'package:flutter/material.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import '../../style/theme.dart' as Style;

class MerchandizingScreen extends StatefulWidget {
  @override
  _MerchandizingScreenState createState() => _MerchandizingScreenState();
}

class _MerchandizingScreenState extends State<MerchandizingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merchandizing"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [CheckinShop()],
        ),
      ),
    );
  }
}
