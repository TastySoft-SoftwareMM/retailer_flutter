import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/screens/main/main-screen.dart';
import 'package:retailer/services/functional_provider.dart';
import 'package:retailer/style/theme.dart' as Style;

class SyncData extends StatefulWidget {
  @override
  _SyncDataState createState() => _SyncDataState();
}

class _SyncDataState extends State<SyncData> {
  ViewModelFunction viewModelFunction;
  String _selectedType = 'Download';
  bool loading = false;
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    viewModelFunction = Provider.of<ViewModelFunction>(context);

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
                  ? Padding(
                      padding:
                          EdgeInsets.only(right: 8, top: 8, left: 8, bottom: 8),
                      child: Center(
                        child: new Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              Container(
                                height: 20,
                                child: LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Style.Colors.mainColor),
                                  backgroundColor: Colors.grey[300],
                                  value: value,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Align(
                                  alignment: Alignment.lerp(Alignment.topLeft,
                                      Alignment.topRight, value * 0.5),
                                  child: Text(
                                    (value * 100).toStringAsFixed(0) + '%',
                                    style: Style.whiteTextStyle,
                                  ),
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
                    if (loading == false) {
                      await syncDataFunction();
                    } else {
                      return null;
                    }
                  },
                  child: Center(
                    child: Text(
                      'Start',
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

  Future<void> syncDataFunction() async {
    setState(() {
      loading = true;
    });
    await viewModelFunction.getMainList();
    await Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 1));
      setState(() {
        value += 0.01;
      });
      if (value >= 1) {
        return false;
      }
      return true;
    }).timeout(Duration(seconds: 5));
    setState(() {
      loading = false;
      value = 0.0;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
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
