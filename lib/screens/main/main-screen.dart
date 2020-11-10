import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/models/shopByListModel.dart';
import 'package:retailer/screens/main/checkInAlert.dart';
import 'package:retailer/screens/main/main_Screen_Search.dart';
import 'package:retailer/stateManagment/functional_provider.dart';
import './main-drawer.dart';
import '../../style/theme.dart' as Style;
import 'main-drawer.dart';
import '../../custom/custom_expansion_title.dart' as custom;
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool loading = true;
  ViewModelFunction viewModelFunction;
  List<ShopByListM> listByUserCode;

  var width;
  var height;
  @override
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    viewModelFunction = Provider.of<ViewModelFunction>(context);
    if (listByUserCode == null) {
      listByUserCode = new List<ShopByListM>();
      getData();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text("Retailer"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: DataSearch(
                        "Search...",
                      ));
                })
          ],
        ),
        drawer: MainDrawer(),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                ),
              )
            : Column(
                children: [
                  viewModelFunction.check.merchandizer == 'true'
                      ? Container()
                      : createUploadMerchandizingWidget(),
                  Container(
                    height: height - 140,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            getShopByUser(),
                            getShopByTeam(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // create upload merchandizing widget
  Widget createUploadMerchandizingWidget() {
    return Container(
      height: 60,
      // decoration: new BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(width: 0.6, color: Style.Colors.borderColor))),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: double.infinity,
          height: 45.0,
          child: RaisedButton(
            elevation: 0,
            onPressed: () {
              print('Upload Merchandizing was tap');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Icon(Icons.cloud_upload),
                SizedBox(width: 20.0),
                Text("Upload Merchandizing"),
                Spacer(),
                Text("331/200")
              ],
            ),
            color: Style.Colors.mainColor,
            textColor: Style.Colors.textColor,
          ),
        ),
      ),
    );
  }

  Widget getShopByUser() {
    List<Widget> getByCharacter = [];
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Style.Colors.dropBackgroundColor,
        child: custom.ExpansionTitle(
          backgroundColor: Style.Colors.dropBackgroundColor,
          initiallyExpanded: false,
          headerBackgroundColor: Style.Colors.mainColor,
          iconColor: Style.Colors.textColor,
          title: Container(
            child: Row(
              children: [
                Text(
                  "My lists of store for visit:",
                  style: TextStyle(color: Style.Colors.textColor),
                ),
                Spacer(),
                Text(
                  '0 / ${viewModelFunction.shopsByUser.length}',
                  style: TextStyle(color: Style.Colors.textColor),
                ),
              ],
            ),
          ),
          onExpansionChanged: (value) {
            // print(value);
          },
          children: [
            new FutureBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                getByCharacter.clear();
                viewModelFunction.shopsByUser.forEach((element) {
                  getByCharacter.add(
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            CheckInAlert()
                                .checkInDialog(context, element.shopname);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(element.shopname,
                                        style: Style.headingTextStyle),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      element.shopname,
                                      style: Style.statusSuccessTextStyle,
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      element.personph,
                                      style: Style.secondTextStyle,
                                    ),
                                    Text(element.address,
                                        style: Style.secondTextStyle)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });

                return Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    new Column(children: getByCharacter),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      itemCount: viewModelFunction.shopsByUser.length == null ? 0 : 1,
    );
  }

  Widget getShopByTeam() {
    List<Widget> getByCharacter = [];
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Style.Colors.dropBackgroundColor,
        child: custom.ExpansionTitle(
          backgroundColor: Style.Colors.dropBackgroundColor,
          initiallyExpanded: false,
          headerBackgroundColor: Style.Colors.mainColor,
          iconColor: Style.Colors.textColor,
          title: Container(
            child: Row(
              children: [
                Container(
                  width: width * 0.6,
                  child: Text(
                    "Other lists ( " + listByUserCode[index].username + " )",
                    style: TextStyle(
                      color: Style.Colors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Spacer(),
                Text(
                  '0 / ${listByUserCode.length}',
                  style: TextStyle(color: Style.Colors.textColor),
                ),
              ],
            ),
          ),
          onExpansionChanged: (value) {
            // print(value);
          },
          children: [
            new FutureBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                getByCharacter.clear();
                List<ShopByListM> list = viewModelFunction.shopsByTeam
                    .where((p) =>
                        p.usercode.contains(listByUserCode[index].usercode))
                    .toList();
                list.forEach((element) {
                  getByCharacter.add(
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            CheckInAlert()
                                .checkInDialog(context, element.shopname);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(element.shopname,
                                        style: Style.headingTextStyle),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      element.shopname,
                                      style: Style.statusSuccessTextStyle,
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      element.personph,
                                      style: Style.secondTextStyle,
                                    ),
                                    Text(element.address,
                                        style: Style.secondTextStyle)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });

                return Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    new Column(children: getByCharacter),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      itemCount: listByUserCode.length ?? 0,
    );
  }

  getData() {
    print('get data is working');
    List<String> getByTeam = [];
    listByUserCode.clear();
    viewModelFunction.shopsByTeam.forEach((allList) {
      if (!getByTeam.contains(allList.usercode)) {
        getByTeam.add(allList.usercode);
        listByUserCode.add(allList);
        print('object' + '$listByUserCode');
      }
    });
    setState(() {
      loading = false;
    });
  }
}
