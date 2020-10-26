import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}
class _SearchListState extends State<SearchList> {
  TextEditingController searchCtrl = TextEditingController();
  List orgList = [
    {
      "name": "aa",
      "visible": false,
      "child": [
        {"name": "one"},
        {"name": "two"},
        {"name": "three"}
      ]
    },
    {
      "name": "bb",
      "visible": false,
      "child": [
        {"name": "four"},
        {"name": "five"},
        {"name": "six"}
      ]
    },
    {
      "name": "cc",
      "visible": false,
      "child": [
        {"name": "seven"},
        {"name": "eight"},
        {"name": "nine"}
      ]
    }
  ];
  List sList = [];
  void onchanged(String value) {
    setState(() {
      if (value == null || value == "") {
        sList = orgList;
      } else {
        sList = orgList
            .where((element) =>
                element["child"]
                    .where((eleVal) => eleVal["name"]
                        .toString()
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList()
                    .length !=
                0)
            .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextField(
              controller: searchCtrl,
              onChanged: onchanged,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: "Search",
              ),
            ),
          ),
          searchCtrl.text == null || searchCtrl.text == ""
              ? Container(
                  height: 300,
                  child: ListView(
                    children: <Widget>[
                      for (var a = 0; a < orgList.length; a++)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (orgList[a]["visible"] == false) {
                                        orgList[a]["visible"] = true;
                                      } else if (orgList[a]["visible"] ==
                                          true) {
                                        orgList[a]["visible"] = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.cyan,
                                    child: Center(
                                        child: Text("${orgList[a]["name"]}")),
                                  ),
                                ),
                                Visibility(
                                  visible: orgList[a]["visible"],
                                  child: Column(
                                    children: <Widget>[
                                      for (var b = 0; b < orgList[a]["child"].length; b++)
                                        Container(
                                          height: 50,
                                          color: Colors.green[100],
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text(
                                                  "${orgList[a]["child"][b]["name"]}")),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                )
              : Container(
                  height: 300,
                  child: ListView(
                    children: <Widget>[
                      for (var a = 0; a < sList.length; a++)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (sList[a]["visible"] == false) {
                                        sList[a]["visible"] = true;
                                      } else if (sList[a]["visible"] ==
                                          true) {
                                        sList[a]["visible"] = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.cyan,
                                    child: Center(
                                        child: Text("${sList[a]["name"]}")),
                                  ),
                                ),
                                Visibility(
                                  visible: sList[a]["visible"],
                                  child: Column(
                                    children: <Widget>[
                                      for (var b = 0;
                                          b < sList[a]["child"].length;
                                          b++)
                                        Container(
                                          height: 50,
                                          color: Colors.green[100],
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text(
                                                  "${sList[a]["child"][b]["name"]}")),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
