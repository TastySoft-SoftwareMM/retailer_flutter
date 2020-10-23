import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retailer/screens/main/search.dart';
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
  List<String> expansionList = [
    'My list of stores for visit : 12/30',
    'Other list John Doe:'
  ];
  var width;
  var height;
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

        body: Column(
          children: [
            Container(height: 60, child: createUploadMerchandizingWidget()),
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

  checkInDialog(String state) {
    List<String> _checkInList = ['Check In', 'Store Closed'];
    String _selectedType; // Option 2
    DateFormat dateFormat = DateFormat("dd/MM/yyyy-HH:mm aaa");

    String currentTime = dateFormat.format(DateTime.now());

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(),
        title: Text(
          'Check In',
          style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1),
        ),
        titlePadding: EdgeInsets.only(top: 20, left: 8),
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageIcon(
                        AssetImage('assets/icon/shop.png'),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            child: Text('Myo Myanmar (မျိုးမြန်မာ)'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageIcon(
                        AssetImage('assets/icon/history.png'),
                        color: Colors.grey[700],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Container(
                            child: Text('$currentTime'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageIcon(
                        AssetImage('assets/icon/pin.png'),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Container(
                            child: Text(
                              '22.23424344 / 96.23424344',
                              style: TextStyle(color: Style.Colors.mainColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ImageIcon(
                        AssetImage('assets/icon/squares.png'),
                      ),
                    ),
                    Flexible(
                      child: state == 'pending'
                          ? Padding(
                              padding: const EdgeInsets.only(top: 28, left: 8),
                              child: Container(
                                child: Text('Check In'),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 15),
                              child: Container(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),

                                  selectedItemBuilder: (value) {
                                    return [
                                      _selectedType == null
                                          ? Text('Select Type')
                                          : Text(_selectedType.toString()),
                                      Text(_selectedType.toString()),
                                    ];
                                  },
                                  isExpanded: true,
                                  hint: Text(
                                      'Select Type'), // Not necessary for Option 1
                                  value: _checkInList[0],
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedType = newValue;
                                    });
                                  },
                                  items: _checkInList.map((element) {
                                    return DropdownMenuItem<String>(
                                      child: Row(
                                        children: [
                                          Text(element),
                                          Spacer(),
                                          _selectedType == element
                                              ? Icon(
                                                  Icons.radio_button_checked,
                                                  color: Style.Colors.mainColor,
                                                )
                                              : Icon(
                                                  Icons.radio_button_off,
                                                  color: Colors.grey[500],
                                                ),
                                        ],
                                      ),
                                      value: element,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageIcon(
                        AssetImage('assets/icon/map.png'),
                        color: Colors.grey[700],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            child: Text(
                                'လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Style.Colors.mainColor, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Center(
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Style.Colors.mainColor,
                                    fontWeight: FontWeight.w500)),
                          )),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Style.Colors.mainColor, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: FlatButton(
                          onPressed: () {
                            print('next button was tap');
                          },
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Style.Colors.mainColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          );
        }),
        contentPadding:
            EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 15),
      ),
    );
  }

  Widget getExpansionList() {
    List<Item> _items = Item.getItems();
    List<Widget> getByCharacter = [];
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        elevation: 0,
        child: custom.ExpansionTitle(
          backgroundColor: Style.Colors.dropBackgroundColor,
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
                          checkInDialog(element._state);
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
