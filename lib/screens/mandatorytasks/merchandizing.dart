import 'package:flutter/material.dart';
import 'package:retailer/screens/components/checkin-shop.dart';
import 'package:retailer/screens/mandatorytasks/merchandizingEdit.dart';
import '../../style/theme.dart' as Style;

import '../../custom/custom_expansion_title.dart' as custom;
import 'package:http/http.dart' as http;

class MerchandizingScreen extends StatefulWidget {
  @override
  _MerchandizingScreenState createState() => _MerchandizingScreenState();
}

class _MerchandizingScreenState extends State<MerchandizingScreen> {
  List<String> expansionList = [
    'SP Bakery',
    'Khit Thit Bakery',
  ];

  var _items = [
    'နံပါတ်၁',
    'နံပါတ်၂',
    'နံပါတ်၃',
    'နံပါတ်၄',
    'နံပါတ်၅',
    'နံပါတ်၆',
    'နံပါတ်၇',
    'နံပါတ်၈',
    'နံပါတ်၉',
    'နံပါတ်၀',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merchandizing"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [CheckinShop(), Flexible(child: getExpansionList())],
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
          title: Text(
            expansionList[index].toString(),
            style: TextStyle(color: Style.Colors.textColor),
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MerchandizingEdit()));
                          },
                          title: Text(element),
                          trailing: IconButton(
                            onPressed: () {
                              print('List was tap');
                            },
                            icon: Icon(Icons.list),
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
