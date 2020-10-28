import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retailer/custom/custom_expansion_title.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import '../../style/theme.dart' as Style;
import 'package:http/http.dart' as http;

// import '../../custom/custom_expansion_title.dart' as custom;

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  String currentTime = DateFormat("dd/MM/yyyy").format(DateTime.now());

  TextEditingController qtyController = TextEditingController();
  var width;
  @override
  Widget build(BuildContext context) {
    if (qtyController.text.isEmpty) {
      qtyController.text = '2';
    }
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: Column(
        children: [
          CheckinShop(),
          Flexible(
            child: ListView(
              children: [
                SizedBox(height: 4,),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 3,
                    child: ExpansionTitle(
                      backgroundColor: Colors.white,
                      initiallyExpanded: false,
                      headerBackgroundColor: Style.Colors.mainColor,
                      iconColor: Style.Colors.textColor,
                      title: Row(
                        children: [
                          Text(
                            '20394239820000',
                            style: TextStyle(color: Style.Colors.textColor),
                          ),
                          Spacer(),
                          Text(
                            '${currentTime.toString()} ',
                            style: TextStyle(color: Style.Colors.textColor),
                          )
                        ],
                      ),
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Remark',
                                    style: Style.headingTextStyle,
                                  ),
                                  Spacer(),
                                  Container(
                                      alignment: Alignment.topRight,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        'Test Comment',
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, left: 8, right: 8),
                          height: 54,
                          color: Colors.red[100],
                          child: Center(
                            child: Text(
                              'Return Products',
                              style: Style.headingTextStyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: getExpansion(),
                        ),
                        getBal(),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 3,
                    child: ExpansionTitle(
                      backgroundColor: Colors.white,
                      initiallyExpanded: false,
                      headerBackgroundColor: Style.Colors.mainColor,
                      iconColor: Style.Colors.textColor,
                      title: Row(
                        children: [
                          Text(
                            '20394239820000',
                            style: TextStyle(color: Style.Colors.textColor),
                          ),
                          Spacer(),
                          Text(
                            '${currentTime.toString()}',
                            style: TextStyle(color: Style.Colors.textColor),
                          )
                        ],
                      ),
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Remark',
                                    style: Style.headingTextStyle,
                                  ),
                                  Spacer(),
                                  Container(
                                      alignment: Alignment.topRight,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        'Test Comment',
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, left: 8, right: 8),
                          height: 54,
                          color: Colors.red[100],
                          child: Center(
                            child: Text(
                              'Order Products',
                              style: Style.headingTextStyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: getExpansion(),
                        ),
                        getBal(),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getExpansion() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: ExpansionTitle(
        initiallyExpanded: false,
        headerBackgroundColor: Style.Colors.mainColor,
        iconColor: Style.Colors.textColor,
        title: Row(
          children: [
            Text(
              'SP Bakery',
              style: TextStyle(color: Style.Colors.textColor),
            ),
          ],
        ),
        onExpansionChanged: (value) {
          // print(value);
        },
        children: [
          SizedBox(
            height: 4,
          ),
          getChildren(),
        ],
      ),
    );
  }

  Widget getBal() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: Text('Subtotal'),
                    ),
                    Container(
                      height: 30,
                      child: Text('Discount Amount (10%)'),
                    ),
                    Container(
                      height: 30,
                      child: Text('Total Amount (90%)'),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
              Container(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      child: Text('200'),
                    ),
                    Container(
                      height: 30,
                      child: Text('20'),
                    ),
                    Container(
                      height: 30,
                      child: Text('180'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getChildren() {
    var secWidth = MediaQuery.of(context).size.width * 0.65;

    List _items = [
      'SP Bread',
      'SP Donut ',
      'SP Long Bread ',
      'SP Cream Roll ',
      'SP No Cream ',
      'SP Stawbarry Bread ',
      'SP Orange Cream '
    ];
    List<Widget> getByCharacter = [];
    return new FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
        getByCharacter.clear();
        _items.forEach((element) {
          getByCharacter.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 100,
                    width: width * 0.22,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/icon/sp_bread1.jpg',
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 100,
                    width: width * 0.68,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 4, top: 4),
                            child: Container(
                                width: secWidth * 0.8,
                                child: Text(
                                  element.toString(),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              Text(
                                '5',
                                style: Style.headingTextStyle,
                              ),
                              Spacer(),
                              Text(
                                '200',
                                style: Style.headingTextStyle,
                              ),
                              Spacer(),
                              Text(
                                '1000',
                                style: Style.headingTextStyle,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });

        return new Column(children: getByCharacter);
      },
    );
  }
}
