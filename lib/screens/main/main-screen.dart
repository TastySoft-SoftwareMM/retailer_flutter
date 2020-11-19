import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/models/shopByListModel.dart';
import 'package:retailer/screens/main/checkInAlert.dart';
import 'package:retailer/screens/main/main_Screen_Search.dart';
import 'package:retailer/services/functional_provider.dart';
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
  ViewModelFunction model;

  var width;
  var height;
  @override
  @override
  Widget build(BuildContext context) {
    model = Provider.of<ViewModelFunction>(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
        body: Column(
          children: [
            model == null
                ? Container()
                : model.getLoginDetail.merchandizer == 'true'
                    ? Container()
                    : createUploadMerchandizingWidget(),
            Container(
              height: height - 140,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      model == null ? Container() : getShopByUser(),
                      model == null ? Container() : getShopByTeam(),
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
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: double.infinity,
          height: 45.0,
          child: RaisedButton(
            elevation: 0,
            onPressed: () {},
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
    List<Widget> getByTeam = [];
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
                  '0 / ${model.shopsByUser.length}',
                  style: TextStyle(color: Style.Colors.textColor),
                ),
              ],
            ),
          ),
          onExpansionChanged: (value) {},
          children: [
            new FutureBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                getByTeam.clear();
                model.shopsByUser.forEach((element) {
                  getByTeam.add(
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
                                        getCurrentTypeSting(
                                            element.status.currentType),
                                        style: getCurrentTypeTS(
                                          element.status.currentType,
                                        )),
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
                    new Column(children: getByTeam),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      itemCount: model.shopsByUser.length == null ? 0 : 1,
    );
  }

  TextStyle getCurrentTypeTS(String currentType) {
    TextStyle textStyle;
    switch (currentType) {
      case "CHECKIN":
        {
          textStyle = Style.statuspendingTextStyle;
        }
        break;

      case "CHECKOUT":
        {
          textStyle = Style.statusSuccessTextStyle;
        }
        break;
      case "STORECLOSED":
        {
          textStyle = Style.statustmpTextStyle;
        }
        break;
      case "TEMPCHECKOUT":
        {
          textStyle = Style.statustmpTextStyle;
        }
        break;

      default:
        {
          textStyle = TextStyle();
        }
        break;
    }
    return textStyle;
  }

  String getCurrentTypeSting(String currentType) {
    String value;
    switch (currentType) {
      case "CHECKIN":
        {
          value = "Pending";
        }
        break;

      case "CHECKOUT":
        {
          value = "Complete";
        }
        break;
      case "STORECLOSED":
        {
          value = "Store Closed";
        }
        break;
      case "TEMPCHECKOUT":
        {
          value = "Temporary Checkout";
        }
        break;

      default:
        {
          value = '';
        }
        break;
    }
    return value;
  }

  Widget getShopByTeam() {
    List<Widget> getByTeam = [];
    List<ShopByListM> filteredList =
        model.shopsByTeam.fold([], (current, next) {
      ShopByListM isExist = current.firstWhere((element) {
        return element.usercode == next.usercode;
      }, orElse: () => null);

      if (isExist == null) {
        current.add(next);
      }
      return current;
    });
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
                    "Other lists ( " + filteredList[index].username + " )",
                    style: TextStyle(
                      color: Style.Colors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Spacer(),
                Text(
                  '0 / ${filteredList.length}',
                  style: TextStyle(color: Style.Colors.textColor),
                ),
              ],
            ),
          ),
          onExpansionChanged: (value) {},
          children: [
            new FutureBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                getByTeam.clear();
                List<ShopByListM> list = model.shopsByTeam
                    .where((p) =>
                        p.usercode.contains(model.shopsByTeam[index].usercode))
                    .toList();
                list.forEach((element) {
                  getByTeam.add(
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
                    new Column(children: getByTeam),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      itemCount: filteredList.length ?? 0,
    );
  }
}
