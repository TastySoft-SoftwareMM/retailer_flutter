import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailer/screens/main/checkInAlert.dart';
import '../../style/theme.dart' as Style;
import '../../custom/custom_expansion_title.dart' as custom;
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate {
  List result;
  List suggestion;

  List orgList = [
    {
      "name": "My list of stores for visit : 12/30",
      "shopList": [
        {
          "name": "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "complete",
        },
        {
          "name": "Aung Yadanar (အောင်ရတနာ)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        },
        {
          "name": "San Pya (စံပြ)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        }
      ]
    },
    {
      "name": "Other list of stores for visit",
      "shopList": [
        {
          "name": "Kanbar Thit (tea shop) (ကမ္ဘာသစ်)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "complete",
        },
        {
          "name": "Nay Won Ni (tea shop) (နေဝန်းနီ)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        },
        {
          "name": "Nay Won (bar & restaurant) (နေဝန်း)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        },
        {
          "name": "Mr Peter (hot & cold) (မစ္စတာပီတာ)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        }
      ]
    },
    {
      "name": "Other list for test",
      "shopList": [
        {
          "name": "Daw Shan (‌ဒေါ်ရှန်)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "complete",
        },
        {
          "name": "Mobile City  (မိုဘိုင်းစီးတီး)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        },
        {
          "name": "Nay Won (bar & restaurant) (နေဝန်း)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        },
        {
          "name": "Shwe Phyu (ရွှေဖြူ)",
          "phone": "09123456789",
          "address":
              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
          "state": "pending",
        }
      ]
    },
  ];
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 15),
      ),
      primaryColor: Style.Colors.mainColor,
      primaryIconTheme: IconThemeData(color: Colors.white),
    );
  }

  final title;
  DataSearch(
    this.title,
  ) : super(
            searchFieldLabel: title,
            searchFieldStyle: TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 1));
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? Container()
          : IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                query = '';
              },
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Widget widget;
    result = orgList
        .where((element) =>
            element["shopList"]
                .where((eleVal) => eleVal["name"]
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList()
                .length !=
            0)
        .toList();
    // print('this is result $result');
    if (result.isEmpty) {
      widget = Center(
        child: Text('no result found'),
      );
    } else if (result.isNotEmpty) {
      widget = getExpansionList(result);
    }
    return widget;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Widget sugWidget;
    suggestion = orgList
        .where((element) =>
            element["shopList"]
                .where((eleVal) => eleVal["name"]
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList()
                .length !=
            0)
        .toList();
    if (suggestion.isEmpty) {
      sugWidget = Center(
        child: Text('no result found'),
      );
    } else if (suggestion.isNotEmpty) {
      sugWidget = getExpansionList(suggestion);
    }
    // if (suggestion.isEmpty) {
    //   sugWidget = Center(
    //     child: CircularProgressIndicator(
    //       strokeWidth: 3,
    //       valueColor: new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
    //     ),
    //   );
    // } else {

    //   // print('this is result $result');
    //   if (suggestion.isEmpty) {
    //     sugWidget = Center(
    //       child: Text('no result found'),
    //     );
    //   } else if (suggestion.isNotEmpty) {
    //     sugWidget = getExpansionList(suggestion);
    //   }
    // }
    return sugWidget;
  }

  Widget getExpansionList(List filteredList) {
    List<Widget> getByCharacter = [];
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        color: Colors.transparent,
        elevation: 3,
        child: custom.ExpansionTitle(
          backgroundColor: Style.Colors.dropBackgroundColor,
          initiallyExpanded: false,
          headerBackgroundColor: Style.Colors.mainColor,
          iconColor: Style.Colors.textColor,
          title: Container(
            child: Row(
              children: [
                Text(
                  filteredList[index]['name'].toString(),
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
          onExpansionChanged: (value) {},
          children: [
            new FutureBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                getByCharacter.clear();
                List shopList = filteredList[index]['shopList'];
                var list = shopList
                    .where((p) =>
                        p['name'].toLowerCase().contains(query.toLowerCase()))
                    .toList();
                list.forEach((element) {
                  getByCharacter.add(
                    Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          CheckInAlert()
                              .checkInDialog(context, element['state']);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(element['name'],
                                      style: Style.headingTextStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    element['state'],
                                    style: Style.statusSuccessTextStyle,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    element['phone'],
                                    style: Style.secondTextStyle,
                                  ),
                                  Text(element['address'],
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
      itemCount: filteredList.length,
    );
  }

  getData() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
