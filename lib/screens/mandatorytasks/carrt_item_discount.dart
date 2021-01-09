
import 'package:flutter/material.dart';
import 'package:retailer/custom/custom_expansion_tile_slidable.dart';

class CartItemDiscountScreen extends StatefulWidget {
  @override
  _CartItemDiscountScreenState createState() => _CartItemDiscountScreenState();
}

class _CartItemDiscountScreenState extends State<CartItemDiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inovice Discountd'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: getExpansion(),
    );
  }
  Widget getExpansion() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 6, left: 6),
      child: Card(
        color: Colors.transparent,
        elevation: 3,
        child: ExpansionTitle(
          backgroundColor: Colors.red[50],
          initiallyExpanded: false,
          headerBackgroundColor: Colors.red[100],
          iconColor: Colors.black,
          title: Text(
            'SP Bakery',
            style:TextStyle(
              fontSize: 15.0,
              height: 1.2,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          onExpansionChanged: (value) {
            // print(value);
          },
          children: [
            SizedBox(
              height: 4,
            ),
           getText(),
          ],
        ),
      ),
    );
  }

  Widget getText() {
    return Container(
      height: 60,
      color: Colors.white,
      child: Center(
          child: Text(
        "No Stock",
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
    );
  }
}
