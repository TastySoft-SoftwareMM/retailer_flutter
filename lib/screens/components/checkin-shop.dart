import 'package:flutter/material.dart';
import '../../style/theme.dart' as Style;

class CheckinShop extends StatefulWidget {
  @override
  _CheckinShopState createState() => _CheckinShopState();
}

class _CheckinShopState extends State<CheckinShop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(width: 70, child: Text("Shop")),
                      Container(width: 20, child: Text("-")),
                      Text("May Zon (မေဇွန်)", style: Style.secondBoldTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(width: 70, child: Text("Phone")),
                      Container(width: 20, child: Text("-")),
                      Text(
                        "0007678767",
                        style: Style.secondBoldTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(width: 70, child: Text("Address")),
                      Container(width: 20, child: Text("-")),
                      Flexible(
                          child: Text(
                              "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
                              style: Style.secondBoldTextStyle)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
