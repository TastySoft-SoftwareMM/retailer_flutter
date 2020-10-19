import 'package:flutter/material.dart';
import 'package:retailer/models/shop-user-model.dart';
import '../../style/theme.dart' as Style;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<ShopUserModel> shopuser;

  @override
  Widget build(BuildContext context) {
    print(shopuser);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerProfileWidget(),
            _tabSection(context),
          ],
        ),
      ),
    );
  }

  Widget headerProfileWidget() {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/notfound.png"),
            ),
            title: Text("Wai Yan Soe"),
            subtitle: Text("09987654567"),
          ),
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            color: Colors.white,
            child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Style.Colors.mainColor,
                indicatorWeight: 3,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: "User shop"),
                  Tab(text: "Team"),
                  Tab(text: "Shop transfer"),
                  Tab(text: "Password reset"),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              userShopWidget(),
              Container(
                child: Text("Articles Body"),
              ),
              Container(
                child: Text("User Body"),
              ),
              Container(
                child: Text("User Body"),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget userShopWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/notfound.png"),
            ),
            title: Text(
              "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
              style: Style.headingTextStyle,
            ),
            subtitle: Text(
              "08767876",
              style: Style.secondTextStyle,
            ),
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/notfound.png"),
            ),
            title: Text(
              "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
              style: Style.headingTextStyle,
            ),
            subtitle: Text(
              "08767876",
              style: Style.secondTextStyle,
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      )),
    );
  }
}
