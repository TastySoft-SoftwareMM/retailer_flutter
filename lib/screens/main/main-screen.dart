import 'package:flutter/material.dart';
import 'package:retailer/screens/main/visit-card.dart';
import './main-drawer.dart';
import './shop-list-screen.dart';
import '../../style/theme.dart' as Style;
import 'main-drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text("Retailer"),
        ),
        drawer: MainDrawer(),
        // body: VisitCard(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Upload Merchandizing
            createUploadMerchandizingWidget(),
            SizedBox(
                height: MediaQuery.of(context).size.height - 136,
                child: SingleChildScrollView(child: ShopListScreen())),
          ],
        ),
      ),
    );
  }

  // create upload merchandizing widget
  Widget createUploadMerchandizingWidget() {
    return Container(
      decoration: new BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.6, color: Style.Colors.borderColor))),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: double.infinity,
          height: 45.0,
          child: RaisedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Icon(Icons.cloud_upload),
                SizedBox(width: 20.0),
                Text("Upload Merchandizing"),
                Spacer(),
                Text("331/200")
              ],
            ),
            color: Style.Colors.mainColor,
            textColor: Style.Colors.textColor,
          ),
        ),
      ),
    );
  }
}
