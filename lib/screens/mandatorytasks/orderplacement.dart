import 'package:flutter/material.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import 'package:retailer/screens/components/loading.dart';
import 'package:retailer/screens/main/visit-card.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import '../../style/theme.dart' as Style;
import '../../custom/custom_expansion_title.dart' as custom;

class OrderPlacementScreen extends StatefulWidget {
  @override
  _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
  var val = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Placement"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => CartItemScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckinShop(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 275,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    recommendStockWidget(),
                    SingleChildScrollView(child: browseAllItemWidget()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget recommendStockWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: custom.ExpansionTitle(
        headerBackgroundColor: Color(0xFFCDD5D8),
        iconColor: Colors.black,
        title: Container(
          child: Text(
            "Recommend Stocks",
            style: TextStyle(color: Colors.black),
          ),
        ),
        children: [Card()],
      ),
    );
  }

  Widget browseAllItemWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Container(
        color: Style.Colors.dropBackgroundColor,
        child: custom.ExpansionTitle(
          headerBackgroundColor: Color(0xFFCDD5D8),
          iconColor: Colors.black,
          title: Container(
            child: Text(
              "Browse All Items",
              style: TextStyle(color: Colors.black),
            ),
          ),
          children: [
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            stockItemWidget(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget stockItemWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 85,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                    image: ExactAssetImage("assets/notfound.png"),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(5)),
          ),
          Expanded(
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text("SP Milk Cake")),
                        InkWell(
                          child: IconButton(
                              onPressed: () {
                                checkOutFun(context);
                              },
                              icon: Icon(Icons.add_shopping_cart)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Style.Colors.incdecCartCountColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("-"),
                                // Container(
                                //   width: 30,
                                //   child: TextFormField(
                                //     maxLength: 3,
                                //     cursorColor: Colors.black,
                                //     decoration: new InputDecoration(
                                //         border: InputBorder.none,
                                //         focusedBorder: InputBorder.none,
                                //         enabledBorder: InputBorder.none,
                                //         errorBorder: InputBorder.none,
                                //         disabledBorder: InputBorder.none,
                                //         hintText: "0"),
                                //   ),
                                // ),
                                // Text("+"),
                              ],
                            ),
                          ),
                          Text("100"),
                          Text("100"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addToCart() {
    print("hello");
    // LoadingScreen load = new LoadingScreen();
    // print(load.hello);
  }

  checkOutFun(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        setState(() {
          LoadingScreen load = new LoadingScreen();
          this.val = load.hello;
          print(this.val);
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      contentPadding: EdgeInsets.all(15),
      content: Text(val),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
