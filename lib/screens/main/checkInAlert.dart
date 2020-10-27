import 'package:flutter/material.dart';
import 'package:retailer/screens/main/visit-card.dart';
import 'package:retailer/screens/mandatorytasks/cart-item.dart';
import '../../style/theme.dart' as Style;
import 'package:intl/intl.dart';

class CheckInAlert {
  checkInDialog(BuildContext context, String state) {
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VisitCard()));
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
}
