import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:retailer/models/get_allstock.dart';
import 'package:retailer/screens/public/widget.dart';
import 'package:retailer/services/functional_provider.dart';
import '../../style/theme.dart' as Style;
import '../../custom/custom_expansion_title.dart' as custom;

class InventoryStock extends StatefulWidget {
  @override
  _InventoryStockState createState() => _InventoryStockState();
}

class _InventoryStockState extends State<InventoryStock> {
  TextEditingController textEditingController = new TextEditingController();
  var val = '1';
  var secWidth;
  var width;
  ViewModelFunction model;
  bool _terms =false;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<ViewModelFunction>(context);
    secWidth = MediaQuery.of(context).size.width * 0.68;
    width = MediaQuery.of(context).size.width;
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
          "Stocks",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 255,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      listByMainItem(),
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

  Widget listByMainItem() {
    var mainCate = [];
    model.allStock.forEach((element) {
      mainCate.add(element.categoryCodeDesc);
    });

    var filteredList = mainCate.toSet().toList();
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return custom.ExpansionTitle(
            backgroundColor: Colors.red[50],
            headerBackgroundColor: Colors.red[100],
            iconColor: Colors.black,
            title: Text(
              filteredList[index],
              style: TextStyle(color: Colors.black),
            ),
            children: [
              listByMainCategory(filteredList[index]),
            ],
          );
        },
        itemCount: filteredList.length,
      ),
    );
  }

  Widget listByMainCategory(mainCate) {
    List<String> subCategory = [];
    model.allStock.forEach((element) {
      if (element.categoryCodeDesc == mainCate) {
        subCategory.add(element.subCategoryCodeDesc);
      }
    });
    var subFilteredList = subCategory.toSet().toList();
    return subFilteredList.length > 0 ? Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              custom.ExpansionTitle(
                headerBackgroundColor: Colors.red[50],
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                title: Text(
                  subFilteredList[index],
                  style: TextStyle(color: Colors.black),
                ),
                children: [
                  listByItems(subFilteredList[index]),
                ],
              ),
              Divider(
                height: 4,
                color: Colors.white,
              )
            ],
          );
        },
        itemCount: subFilteredList.length,
      ),
    ): noDataWidget();
  }

  Future<List<GetAllStock>> getListBySubCate(items) async {
    List<GetAllStock> itemList =
      model.allStock.where((p) => p.subCategoryCodeDesc.contains(items)).toList();
    return itemList;
  }

  Widget listByItems(subCate) {
    var secWidth = MediaQuery.of(context).size.width * 0.7 - 10;
    var width = MediaQuery.of(context).size.width - 10;

    return FutureBuilder(
      future: getListBySubCate(subCate),
      builder: (BuildContext context, AsyncSnapshot<List<GetAllStock>> snapshot) {
        Widget children;
        if (snapshot.hasData) {
      children = snapshot.data.length > 0 ? ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var seleted = false;
          return Container(
            height: 110,
            child: Row(
              children: [
                getPhotoContainer(width, snapshot.data[index].img),
                  Container(width: 5,),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: width * 0.72 - 1.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4, right: 4, top: 8),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Container(
                                      width: secWidth * 0.7,
                                      child: Text(
                                        snapshot.data[index].desc,
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.w500,
                                          height: 1,
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.red,
                                  value: _terms,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _terms = value;
                                    });
                                  },
                                )
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
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: secWidth * 0.35,
                                      child: Card(
                                        color: Colors.grey[200],
                                        elevation: 2,
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
                                                  padding: EdgeInsets.only(
                                                      right: 8, top: 8, bottom: 8, left: 4),
                                                  child: ImageIcon(
                                                    AssetImage('assets/icon/minus.png'),
                                                    color: Style.Colors.mainColor,
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
                                                padding: EdgeInsets.only(
                                                    left: 8, top: 8, bottom: 10),
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
                                                padding: EdgeInsets.only(
                                                    left: 8, top: 10, bottom: 10),
                                                child: ImageIcon(
                                                  AssetImage('assets/icon/add.png'),
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
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: secWidth * 0.35,
                                      child: Card(
                                        color: Colors.grey[200],
                                        elevation: 2,
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
                                                  padding: EdgeInsets.only(
                                                      right: 8, top: 8, bottom: 8, left: 4),
                                                  child: ImageIcon(
                                                    AssetImage('assets/icon/minus.png'),
                                                    color: Style.Colors.mainColor,
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
                                                  width:
                                                  secWidth * 0.1,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 8, top: 8, bottom: 10),
                                                  child: Text(val),
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
                                                  padding: EdgeInsets.only(
                                                      left: 8, top: 10, bottom: 10),
                                                  child: ImageIcon(
                                                    AssetImage('assets/icon/add.png'),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(),
          );
        },
        itemCount: snapshot.data.length,
      ): noDataWidget();
    } else if (snapshot.hasError) {
      children = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Error: something went worng !'),
      );
    } else {
      children = SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
            );
          }
      return children;
    }
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
                  val = textEditingController.text;
                  Navigator.pop(context, true);
                });
              },
              child: new Text("OK"))
            ],
          ),
        ],
      );
    },
  );
}

  Widget noDataWidget() {
    return Container(
      height: 60,
      color: Colors.white,
      child: Center(
        child: Text(
          "No Stock",
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ),
    );
  }
}


