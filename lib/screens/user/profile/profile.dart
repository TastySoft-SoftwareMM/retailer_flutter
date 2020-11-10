import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Team.dart';
import 'ShopTransfer.dart';
import 'PasswordReset.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
        actions: [],
        leading: Icon(Icons.arrow_back_outlined),
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
      initialIndex: 0,
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.red[50],
            child: TabBar(
                onTap: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: this.currentIndex == 0 ? Container(
                      // color: Colors.white,
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'User Shop',
                        ),
                      ),
                    ) : Container(
                      child: Center(
                        child: Text(
                            'User Shop'
                        ),
                      ),
                    ),
                  ),

                  Tab(
                    // text: "User shop"
                    child: this.currentIndex == 1 ? Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Team',
                        ),
                      ),
                    ) : Container(
                      child: Center(
                        child: Text(
                          'Team',
                        ),
                      ),
                    ),
                  ),

                  Tab(
                    // text: "User shop"
                    child: this.currentIndex == 2 ? Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Shop Transfer',
                        ),
                      ),
                    ) : Container(
                      child: Center(
                        child: Text(
                            'Shop transfer'
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    // text: "User shop"
                    child: this.currentIndex == 3 ? Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Password Reset',
                        ),
                      ),
                    ) : Container(
                      child: Center(
                        child: Text(
                          'Password Reset',
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              userShopWidget(),
              TeamWidget(),
              TransferWidget(),
              PasswordWidget(),
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
                ),
                subtitle: Text(
                  "08767876",
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
                  "Thidar Store(သီတာစတိုး)",
                ),
                subtitle: Text(
                  "226412796369",
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
                  "Toe Kyaw Kyaw(တိုးကျော်ကျော်)",
                ),
                subtitle: Text(
                  "485126047063",
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
                  "Shwe Poe(ရွှေပိုး)",
                ),
                subtitle: Text(
                  "511057401433",
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