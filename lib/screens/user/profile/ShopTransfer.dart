import 'package:flutter/material.dart';

class transferWidget extends StatefulWidget {
  @override
  _transferWidgetState createState() => _transferWidgetState();
}

class _transferWidgetState extends State<transferWidget> {

  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getWidget(),
            getDropWidget(),
          ],
        ),
      ),
    );
  }

  Widget getWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Image.asset('assets/shop.png', width: 20,
                height: 20, fit: BoxFit.cover),
          ),
          // child: Image.asset('assets/user.png', fit: BoxFit.cover),

          Flexible(
            child: DropdownButton(
              hint: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Text('Select Shop'),
              ),
              // Image.asset('assets/user.png', fit: BoxFit.cover),
              selectedItemBuilder: (value) {
                return [
                  Text('Thidar Store(သီတာစတိုး) '),
                  Text('Toe Kyaw Kyaw(တိုးကျော်ကျော်)'),
                  Text('Shwe Poe(ရွှေပိုး)'),
                ];
              },
              value: _dropDownValue,
              isExpanded: true,
              iconSize: 30.0,
              items: [
                'Thidar Store(သီတာစတိုး)',
                'Toe Kyaw Kyaw(တိုးကျော်ကျော်)',
                'Shwe Poe(ရွှေပိုး)'
              ].map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Row(
                      children: [
                        Text(val),
                        Spacer(),
                        _dropDownValue != val ? Icon(Icons.radio_button_off) : Icon(
                          Icons.radio_button_checked, color: Colors.red,)
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(() {
                  _dropDownValue = val;
                },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _dropDown;
  Widget getDropWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top:2),
            // child: Image.asset('assets/user.png', fit: BoxFit.cover),
            child: Icon(Icons.account_circle_rounded),
          ),
          // child: Image.asset('assets/user.png', fit: BoxFit.cover),

          Flexible(
            child: DropdownButton(
              hint: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Text('Select User'),
              ),
              // Image.asset('assets/user.png', fit: BoxFit.cover),
              selectedItemBuilder: (value) {
                return [
                  Text('Thidar Store(သီတာစတိုး) '),
                  Text('Toe Kyaw Kyaw(တိုးကျော်ကျော်)'),
                  Text('Shwe Poe(ရွှေပိုး)'),
                ];
              },
              value: _dropDown,
              isExpanded: true,
              iconSize: 30.0,
              items: [
                'Thidar Store(သီတာစတိုး)',
                'Toe Kyaw Kyaw(တိုးကျော်ကျော်)',
                'Shwe Poe(ရွှေပိုး)'
              ].map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Row(
                      children: [
                        Text(val),
                        Spacer(),
                        _dropDown != val ? Icon(Icons.radio_button_off) : Icon(
                          Icons.radio_button_checked, color: Colors.red,)
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(() {
                  _dropDown = val;
                },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}








