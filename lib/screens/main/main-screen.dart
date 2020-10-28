import 'package:flutter/material.dart';
import 'package:retailer/screens/main/checkInAlert.dart';
import 'package:retailer/screens/main/main_Screen_Search.dart';
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
  List<String> expansionList = [
    'My list of stores for visit : 12/30',
    'Other list John Doe:',
  ];

  List<Item> _items = Item.getItems();

  var width;
  var height;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
              body: loading?Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                ),
              ):Column(
                children: [
                  Container(
                      height: 60, child: createUploadMerchandizingWidget()),
                  Expanded(child: getExpansionList()),
                ],
              ),
            ),
    );
  }

  // create upload merchandizing widget
  Widget createUploadMerchandizingWidget() {
    return Container(
      height: 60,
      decoration: new BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.6, color: Style.Colors.borderColor))),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: double.infinity,
          height: 45.0,
          child: RaisedButton(
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

  Widget getExpansionList() {
    List<Widget> getByCharacter = [];
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        color: Colors.transparent,
        elevation: 3,
        child: custom.ExpansionTitle(
          backgroundColor: Colors.white,
          initiallyExpanded: false,
          headerBackgroundColor: Style.Colors.mainColor,
          iconColor: Style.Colors.textColor,
          title: Container(
            child: Row(
              children: [
                Text(
                  expansionList[index].toString(),
                  style: TextStyle(color: Style.Colors.textColor),
                ),
                Spacer(),
                Text(
                  '0 / 3',
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
                _items.forEach((element) {
                  getByCharacter.add(
                    Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          CheckInAlert().checkInDialog(context, element._state);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(element._name,
                                      style: Style.headingTextStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    element._state,
                                    style: Style.statusSuccessTextStyle,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    element._phone,
                                    style: Style.secondTextStyle,
                                  ),
                                  Text(element._address,
                                      style: Style.secondTextStyle)
                                ]),
                          ),
                        ),
                      ),
                    ),
                  );
                });

                return new Column(children: getByCharacter);
              },
            ),
          ],
        ),
      ),
      itemCount: expansionList.length,
    );
  }

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      loading = false;
    });
  }
}

class Item {
  int _id;
  String _name;
  String _phone;
  String _address;
  String _state;

  Item(this._id, this._name, this._phone, this._address, this._state);

  static List<Item> getItems() {
    return <Item>[
      Item(
          0,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'complete'),
      Item(
          1,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'pending'),
      Item(
          2,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'complete'),
      Item(
          3,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'pending'),
      Item(
          4,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'complete'),
      Item(
          5,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'pending'),
      Item(
          6,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'complete'),
      Item(
          7,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'pending'),
      Item(
          8,
          "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          '09123456789',
          'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n',
          'complete'),
    ];
  }
}
