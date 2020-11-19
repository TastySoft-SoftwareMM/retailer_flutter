import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/screens/user/profile/userShop.dart';
import 'package:retailer/services/functional_provider.dart';
import 'Team.dart';
import 'ShopTransfer.dart';
import 'PasswordReset.dart';
import 'package:retailer/style/theme.dart' as Style;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ViewModelFunction model;
  bool loadData = true;

  @override
  Widget build(BuildContext context) {
    if (loadData == true) {
      model = Provider.of<ViewModelFunction>(context);
      setState(() {
        getDate().then((value) {
          loadData = value;
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerProfileWidget(),
            Divider(height: 1,color: Colors.grey,),
            _tabSection(context),
          ],
        ),
      ),
    );
  }

  Widget headerProfileWidget() {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage("assets/notfound.png"),
      ),
      title: Text(
        model.getLoginDetail == null
            ? "Unknown User"
            : model.getLoginDetail.userName,
        style: Style.headingTextStyle,
      ),
      subtitle: Text(
          model.getLoginDetail == null
              ? "Unknown number"
              : model.getLoginDetail.userId,
          style: Style.headingTextStyle),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.red[50],
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  tabs: [
                    Tab(
                      child: Text('User Shop'),
                    ),
                    Tab(
                      child: Text(
                        'Team',
                      ),
                    ),
                    Tab(
                      child: Text('Shop transfer'),
                    ),
                    Tab(
                      child: Text(
                        'Password Reset',
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              UserShop(),
              TeamWidget(),
              TransferWidget(),
              PasswordWidget(),
            ]),
          ),
        ],
      ),
    );
  }

  Future<bool> getDate() async {
    await model.login('+959788571913', '123');
    await model.getMainList();
    return false;
  }
}
