import 'package:flutter/material.dart';
import '../../style/theme.dart' as Style;

class CartItemScreen extends StatefulWidget {
  @override
  _CartItemScreenState createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Style.Colors.borderColor, width: 0.6))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "May Zon (မေဇွန်)",
                              style: Style.headingPrimaryTextStyle,
                            ),
                            Text(
                                "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n"),
                            Text("15/09/2020")
                          ], 
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ],
            ),
            Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Style.Colors.mainColor,
                        textColor: Style.Colors.textColor,
                        onPressed: () {},
                        child: Text("Complete Visit"),
                      ),
                      RaisedButton(
                        color: Style.Colors.mainColor,
                        textColor: Style.Colors.textColor,
                        onPressed: () {},
                        child: Text("Print"),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(seconds: 1),
                        crossFadeState: _first
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: RaisedButton(
                          color: Style.Colors.mainColor,
                          textColor: Style.Colors.textColor,
                          onPressed: () {
                            setState(() {
                              _first = false;
                            });
                          },
                          child: Text("Order Confirm"),
                        ),
                        secondChild: RaisedButton(
                          color: Style.Colors.mainColor,
                          textColor: Style.Colors.textColor,
                          onPressed: () {
                            setState(() {
                              _first = true;
                            });
                          },
                          child: Text("Order Update"),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
