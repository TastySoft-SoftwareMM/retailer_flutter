import 'package:flutter/material.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import '../../style/theme.dart' as Style;
import '../../custom/custom_expansion_title.dart' as custom;

class OrderPlacementScreen extends StatefulWidget {
  @override
  _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
  List<String> list = ["Baked Goods", "Lotte", "Soft drinks", "DD"];
  List<String> typelist = ['Bread', 'Pastries', 'Cake'];
  final List data = [
    "Price Discount Cream Roll",
    "Test",
  ];
  List<String> mainList = [
    'Sp_Blueberry Cream Roll',
    'Sp-Blackberry Cream Roll'
  ];
  TextEditingController textEditingController = new TextEditingController();
  var val ='1';
  var secWidth;
  var width;

  @override
  Widget build(BuildContext context) {
    secWidth = MediaQuery
        .of(context)
        .size
        .width * 0.68;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 255,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      recommendStockWidget('Promotion Items'),
                      browseAllitemWidget('Recommend Stocks'),
                      mianExpansiontile(),
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

  Widget mianExpansiontile() {
    return Padding(
      padding: const EdgeInsets.only(top:2.0),
      child: custom.ExpansionTitle(
        backgroundColor: Colors.red[100],
        headerBackgroundColor: Colors.red,
        iconColor: Colors.white,
        title: Container(
          child: Text("Browse All Items", style: TextStyle(color: Colors.white)),
        ),
        children: [
          getTile() 
          ],
      ),
    );
  }
  Widget getTile() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => custom.ExpansionTitle(
          backgroundColor: Colors.red[50],
          headerBackgroundColor: Colors.red[100],
          iconColor: Colors.black,
          title: Text(
            list[index],
            style: TextStyle(color: Colors.black),
          ),
          children: [Container(child: getSecondTile())],
        ),
        itemCount: list.length,
      ),
    );
  }

  Widget getSecondTile() {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => custom.ExpansionTitle(
          headerBackgroundColor: Colors.red[50],
          iconColor: Colors.black,
          title: Text(
            typelist[index],
            style: TextStyle(color: Colors.black),
          ),
          children: [
            recomandItemWidget(),
          ],
        ),
        itemCount: typelist.length,
      ),
    );
  }


  Widget recommendStockWidget(String title) {
    return Container(
      child: custom.ExpansionTitle(
        headerBackgroundColor: Colors.red,
        iconColor: Colors.white,
        title: Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        children: [
          getMainExpansion(),
        ],
      ),
    );
  }

  Widget browseAllitemWidget(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: custom.ExpansionTitle(
        // backgroundColor: Style.Colors.dropBackgroundColor,
        headerBackgroundColor: Colors.red,
        iconColor: Colors.white,
        title: Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          getText(),
        ],
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
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),
          )
      ),
    );
  }

  Widget recomandItemWidget() {
    var secWidth = MediaQuery
        .of(context)
        .size
        .width * 0.7 - 10;
    var width = MediaQuery
        .of(context)
        .size
        .width - 10;
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          Container(
            height: 110,
            child: Row(
              children: [
                Container(
                  width: width * 0.25,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/icon/sp_bread3.jpg',
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 110,
                    width: width * 0.72 - 1.5,
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
                                    left: 4, right: 4, top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Container(
                                      width: secWidth * 0.7,
                                      child: Text(
                                        mainList[index],
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      )),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: ImageIcon(
                                  AssetImage('assets/icon/add-to-cart.png'),
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  print('Shop  was tap');
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
                                    Container(
                                      height: 40,
                                      width: secWidth * 0.35,
                                      child: Card(
                                        elevation: 1,
                                        color: Colors.grey[200],
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
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 8,
                                                      top: 8,
                                                      bottom: 8,
                                                      left: 4),
                                                  child: ImageIcon(
                                                    AssetImage(
                                                        'assets/icon/minus.png'),
                                                    color:
                                                    Style.Colors.mainColor,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _showDialog();
                                              },
                                              child: Container(
                                                height: 40,
                                                width: secWidth * 0.1,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: Text(val),
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
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: ImageIcon(
                                                    AssetImage(
                                                        'assets/icon/add.png'),
                                                    color:
                                                    Style.Colors.mainColor,
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
                                      padding: const EdgeInsets.only(
                                          left: 4),
                                      child: Container(
                                        // height: 40,
                                        width: secWidth * 0.35,
                                        child: Text(
                                          "100",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: secWidth * 0.16,
                                      child: Text(
                                        "100",
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
            decoration: BoxDecoration(),
          ),
      itemCount: mainList.length,
    );
  }

  Widget getMainExpansion() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          custom.ExpansionTitle(
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            headerBackgroundColor: Colors.red[100],
            iconColor: Colors.black,
            title: Text(
              data[index],
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
            ),
            children: [
              recomandItemWidget(),
            ],
          ),
      itemCount: data.length,
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "SP_Blueberry Cream Roll",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          content: TextField(
            controller: textEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter the number'),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                    onPressed: () {
                      setState(() {
                        val=textEditingController.text;
                        Navigator.pop(context,true);
                      });
                    }, child: new Text("OK"))
              ],
            ),
          ],
        );
      },
    );
  }

}
