import 'package:flutter/material.dart';
import 'package:retailer/screens/main/main-screen.dart';
import 'package:retailer/style/theme.dart' as Style;

class SyncData extends StatefulWidget {
  @override
  _SyncDataState createState() => _SyncDataState();
}

class _SyncDataState extends State<SyncData> {
  String _selectedType = 'Download';
  bool downloadData = false;
  bool loading = false;
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Data'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 45,
                color: Style.Colors.mainColor,
                child: Center(
                  child: Text(
                    'Sync',
                    style: Style.whiteTextStyle,
                  ),
                ),
              ),
              loading
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 15, right: 8, left: 8, bottom: 15),
                      height: 45,
                      child: Center(
                        child: new Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              Container(
                                height: 30,
                                child: LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Style.Colors.mainColor),
                                  backgroundColor: Colors.grey[200],
                                  value: value,
                                ),
                              ),
                              Align(
                                alignment: Alignment.lerp(Alignment.topLeft,
                                    Alignment.topRight, value * 0.5),
                                child: Text(
                                  (value * 100).toStringAsFixed(0),
                                  style: Style.whiteTextStyle,
                                ),
                              ),
                            ]),
                      ),
                    )
                  : Container(),
              InkWell(
                onTap: () {
                  showToSelected();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Type',
                              style: Style.headingTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _selectedType,
                              style: Style.headingTextStyle,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey[400],
                        )
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: FlatButton(
                  color: Style.Colors.mainColor,
                  onPressed: () async {
                    if (downloadData == true) {
                  await    testFunction();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    } else if (downloadData == false) {
                      testFunction();
                    }
                  },
                  child: Center(
                    child: Text(
                      downloadData ? 'Start' : 'Download Stock Images',
                      style: Style.whiteTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> testFunction() async {
    setState(() {
      loading = true;
    });
    await Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        value += 0.01;
      });
      if (value >= 1) {
        return false;
      }
      return true;
    });
    // .timeout(Duration(seconds: 20)).then(print).catchError(print);
    setState(() {
      loading = false;
      value = 0.0;
      downloadData = true;
    });
  }

  showToSelected() {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return new Align(
          alignment: Alignment(0.9, -0.4),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              width: 200,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedType = 'Download';
                            Navigator.pop(context, true);
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Download',
                              style: Style.headingTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            _selectedType == 'Download'
                                ? Icon(
                                    Icons.radio_button_checked,
                                    color: Style.Colors.mainColor,
                                  )
                                : Icon(
                                    Icons.radio_button_off,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedType = 'Upload';
                            Navigator.pop(context, true);
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Upload',
                              style: Style.headingTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            _selectedType == 'Upload'
                                ? Icon(
                                    Icons.radio_button_checked,
                                    color: Style.Colors.mainColor,
                                  )
                                : Icon(
                                    Icons.radio_button_off,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
