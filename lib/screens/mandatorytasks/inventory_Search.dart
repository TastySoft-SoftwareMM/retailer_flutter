import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style/theme.dart' as Style;

class InventorySearch extends SearchDelegate {
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
  final List<String> mainList;
  InventorySearch(this.title, this.mainList)
      : super(
            searchFieldLabel: title,
            searchFieldStyle: TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 1));
  List<String> suggestion;
  List<String> result;
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

    result = mainList
        .where((p) => p.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print('this is result $result');
    if (result.isEmpty) {
      widget = Center(
        child: Text('no result found'),
      );
    } else if (result.isNotEmpty) {
      widget = getStockList(context, result);
    }
    return widget;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Widget widget;
    if (query.isEmpty) {
      widget = getStockList(context, mainList);
    } else {
      suggestion = mainList
          .where((p) => p.toLowerCase().contains(query.toLowerCase()))
          .toList();
          widget = getStockList(context, suggestion);
    }
    return widget;
  }

  Widget getStockList(BuildContext context, List<String> list) {
    var secWidth = MediaQuery.of(context).size.width * 0.7;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
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
                      'assets/icon/sp_bread1.jpg',
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Container(
                height: 110,
                width: width * 0.73,
                child: Card(
                  child: Column(
                    children: [
                      Spacer(),
                      Spacer(),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 4),
                              child: Container(
                                  width: secWidth * 0.8,
                                  child: Text(
                                    list[index],
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  )),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 10),
                              child: InkWell(
                                onTap: () {
                                  print('delete was tap');
                                },
                                child: ImageIcon(
                                  AssetImage('assets/icon/delete.png'),
                                  size: 23,
                                  color: Style.Colors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                    color: Colors.grey[50],
                                    elevation: 0,
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
                                              // controller: qtyController,
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
                                    color: Colors.grey[50],
                                    elevation: 0,
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
                                              // controller: qtyController,
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
              )
            ],
          ),
        ),
      ),
      itemCount: list.length,
    );
  }
}
