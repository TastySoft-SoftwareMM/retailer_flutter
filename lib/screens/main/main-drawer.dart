import 'package:flutter/material.dart';
import 'package:retailer/screens/user/profile.dart';
import '../../style/theme.dart' as Style;

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Profile()));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                            image: ExactAssetImage("assets/notfound.png"),
                            fit: BoxFit.cover),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Style.Colors.mainColor,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Style.Colors.iconColor,
                ),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context, true);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Style.Colors.iconColor,
                ),
                title: Text('Order List'),
                onTap: () {
                  Navigator.pop(context, true);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              Divider(
                height: 1,
              ),
            ],
          )),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Logout"),
                  color: Style.Colors.mainColor,
                  textColor: Style.Colors.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
