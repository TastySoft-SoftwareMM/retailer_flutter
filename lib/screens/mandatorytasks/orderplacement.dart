import 'package:flutter/material.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import 'package:retailer/screens/components/loading.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import '../../style/theme.dart' as Style;
import '../../custom/custom_expansion_title.dart' as custom;

class OrderPlacementScreen extends StatefulWidget {
  @override
  _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
  var val = "";
  TextEditingController qtyController = TextEditingController();
  TextEditingController expqtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (qtyController.text == '') {
      qtyController.text = '1';
    }
    if (expqtyController.text == '') {
      expqtyController.text = '1';
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(
          "Order Placement",
          style: TextStyle(color: Colors.white),
        ),
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
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('tap on search');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      RecommendStockWidget('Recommend Stocks'),
                      BrowseAllitemWidget('Browse All Items'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget RecommendStockWidget(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: custom.ExpansionTitle(
        backgroundColor: Style.Colors.dropBackgroundColor,
        headerBackgroundColor: Colors.red,
        iconColor: Colors.white,
        title: Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        children: <Widget>[
          SizedBox(height: 4,),
          RecomandItemWidget(),
          showMore(),
          addToCart(),
        ],
      ),
    );
  }

  Widget BrowseAllitemWidget(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: custom.ExpansionTitle(
        backgroundColor: Style.Colors.dropBackgroundColor,
        headerBackgroundColor: Colors.red,
        iconColor: Colors.white,
        title: Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        children: <Widget>[
          SizedBox(height: 4,),
          BrowseItemWidget(),
        ],
      ),
    );
  }




  Widget RecomandItemWidget() {
    var secWidth = MediaQuery.of(context).size.width * 0.7 - 10;
    var width = MediaQuery.of(context).size.width - 10;
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          height: 110,
          child: Row(
            children: [
              Container(
                width: width * 0.25,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/notfound.png',
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Container(
                  height: 110,
                  width: width * 0.72-1.5,
                  child: Card(
                    child: Column(
                      children: [
                        Spacer(),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4,
                                  right: 4,
                                  top: 8
                              ),
                              child: Container(
                                  width: secWidth * 0.7,
                                  child: Text(
                                    'Attack on Titan',
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  )),
                            ),
                            Spacer(),
                            IconButton(
                              icon: ImageIcon(
                                AssetImage('assets/icon/delete.png'),
                                color: Style.Colors.mainColor,
                              ),
                              onPressed: () {
                                print('delet was tap');
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: secWidth * 0.45,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      height: 40,
                                      width: secWidth * 0.08,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Qty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: secWidth * 0.35,
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.grey[50],
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print('minus one was tap');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 8,
                                                    left: 4),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/minus.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              width: secWidth * 0.1,
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),
                                                controller: qtyController,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(bottom: 14),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('object');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 10, bottom: 10),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/add.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: secWidth * 0.55,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      height: 40,
                                      width: secWidth * 0.16,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Exp qty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: secWidth * 0.35,
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.grey[50],
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print('minus two was tap');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 8,
                                                    left: 4),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/minus.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              width: secWidth * 0.1,
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),
                                                controller: expqtyController,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(bottom: 14),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('plus two was tap ');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 10, bottom: 10),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/add.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(


          ),
        ),
      ),
      itemCount: 10,
    );
  }

  Widget BrowseItemWidget() {
    var secWidth = MediaQuery.of(context).size.width * 0.7 - 10;
    var width = MediaQuery.of(context).size.width - 10;
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          height: 110,
          child: Row(
            children: [
              Container(
                width: width * 0.25,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/notfound.png',
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Container(
                  height: 110,
                  width: width * 0.72-1.5,
                  child: Card(
                    child: Column(
                      children: [
                        Spacer(),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4,
                                  right: 4,
                                  top: 8
                              ),
                              child: Container(
                                  width: secWidth * 0.7,
                                  child: Text(
                                    'Attack on Titan',
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  )),
                            ),
                            Spacer(),
                            IconButton(
                              icon: ImageIcon(
                                AssetImage('assets/icon/add-to-cart.png'),
                              ),
                              onPressed: () {
                                print('delete was tap');
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: secWidth * 0.45,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      height: 40,
                                      width: secWidth * 0.08,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Qty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: secWidth * 0.35,
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.grey[50],
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print('minus one was tap');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 8,
                                                    left: 4),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/minus.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              width: secWidth * 0.1,
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),
                                                controller: qtyController,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(bottom: 14),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('object');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 10, bottom: 10),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/add.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: secWidth * 0.55,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      height: 40,
                                      width: secWidth * 0.16,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Exp qty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: secWidth * 0.35,
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.grey[50],
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print('minus two was tap');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 8,
                                                    left: 4),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/minus.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              width: secWidth * 0.1,
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),
                                                controller: expqtyController,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(bottom: 14),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('plus two was tap ');
                                            },
                                            child: Container(
                                              height: 40,
                                              width: secWidth * 0.1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 10, bottom: 10),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/icon/add.png'),
                                                  color: Style.Colors.mainColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      itemCount: 10,
    );
  }

  showMore() {
    return FlatButton(
      onPressed: () {
        /*...*/
      },
      child: Text(
        "Load More",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  addToCart() {
    return Container(
      width: 480,
      child: FlatButton(
        color: Colors.red,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.deepOrange,
        onPressed: () {},
        child: Text(
          "Add to Cart",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
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
