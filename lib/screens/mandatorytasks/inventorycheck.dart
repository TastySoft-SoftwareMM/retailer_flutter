import 'package:flutter/material.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import '../../style/theme.dart' as Style;

class InventoryCheckScreen extends StatefulWidget {
  @override
  _InventoryCheckScreenState createState() => _InventoryCheckScreenState();
}

class _InventoryCheckScreenState extends State<InventoryCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Check"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Style.Colors.mainColor,
        child: Icon(Icons.add),
        foregroundColor: Style.Colors.textColor,
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
