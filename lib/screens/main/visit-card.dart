import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import 'package:retailer/screens/main/main-drawer.dart';
import 'package:retailer/screens/main/main-screen.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import 'package:retailer/screens/mandatorytasks/inventorycheck.dart';
import 'package:retailer/screens/mandatorytasks/merchandizing.dart';
import 'package:retailer/screens/mandatorytasks/orderplacement.dart';
import 'package:retailer/screens/public/widget.dart';
import '../../style/theme.dart' as Style;
import 'package:flutter_svg/flutter_svg.dart';

class VisitCard extends StatefulWidget {
  @override
  _VisitCardState createState() => _VisitCardState();
}

class _VisitCardState extends State<VisitCard> {
  bool isSwitched = false;
  bool first = false;
  List<VisitCardModel> visitcards = [
    checkout,
    inventorycheck,
    merchandizing,
    orderplacement
  ];
  @override
  void initState() {
    super.initState();
    print("Init State");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text("Retailer"),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                CartItemScreen()));
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                CheckinShop(),
                createCardWidget(),
                createSkipOrderplacementWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createCardWidget() {
    return GridView.count(
        shrinkWrap: true,
        controller: new ScrollController(keepScrollOffset: false),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        childAspectRatio: 1.7 / 1.5,
        children: visitcards.map((card) {
          return Card(
              elevation: 3.0,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              margin: EdgeInsets.all(5),
              child: InkWell(
                onTap: () => cardClick(card.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      top: 10,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 10.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Style.Colors.borderColor,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 4.5,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                          child: Container(
                              height: 40,
                              child: SvgPicture.asset(
                                card.img,
                                color: Style.Colors.mainColor,
                              ))),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          color: Style.Colors.mainColor,
                          height: 40,
                          child: Center(
                              child: Text(
                            card.text,
                            style: Style.whiteTextStyle,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        }).toList());
  }

  cardClick(id) {
    print(id);

    switch (id) {
      case 1:
        checkOutFun(context);
        break;
      case 2:
        Navigator.push(
            context,
            new CupertinoPageRoute(
                builder: (context) => InventoryCheckScreen()));
        break;
      case 3:
        Navigator.push(context,
            new CupertinoPageRoute(builder: (context) => MerchandizingScreen()));
        break;
      case 4:
         loading(
          context,
        );
        Navigator.push(
            context,
            new CupertinoPageRoute(
                builder: (context) => OrderPlacementScreen()));
        break;
    }
  }

  Widget createSkipOrderplacementWidget() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Skip Order Placement",
                style: Style.headingTextStyle,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    first = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Style.Colors.mainColor,
                activeColor: Style.Colors.mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkOutFun(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No", style: TextStyle(color: Style.Colors.iconColor)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => MainScreen()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      contentPadding: EdgeInsets.all(15),
      content: Text("Do you want to checkout?"),
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

class VisitCardModel {
  int id;
  String text;
  String img;

  VisitCardModel({this.id, this.text, this.img});
}

VisitCardModel checkout =
    new VisitCardModel(id: 1, text: "1. Check Out", img: "assets/checkout.svg");
VisitCardModel inventorycheck = new VisitCardModel(
    id: 2, text: "2. Inventory Check", img: "assets/supplier_fill.svg");
VisitCardModel merchandizing = new VisitCardModel(
    id: 3, text: "3. Merchandizing", img: "assets/product_order_fill.svg");
VisitCardModel orderplacement = new VisitCardModel(
    id: 4, text: "4. Order Placement", img: "assets/order_fill.svg");
