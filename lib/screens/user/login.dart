import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:retailer/screens/user/sign_up.dart';
import 'package:retailer/screens/user/syncData/syncData.dart';
import 'package:retailer/screens/user/syncData/toast.dart';
import 'package:retailer/stateManagment/loginStateVM.dart';
import '../../style/theme.dart' as Style;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var width;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passController = TextEditingController();
  NewLoginViewModel newLoginViewModel;
  // String _userId;

  @override
  Widget build(BuildContext context) {
    newLoginViewModel = Provider.of<NewLoginViewModel>(context);

    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PopupMenuButton<dynamic>(
                  offset: Offset(10, 10),
                  onSelected: (value) => onMenuSelection(value),
                  icon: Icon(Icons.more_vert, color: Colors.black),
                  itemBuilder: (BuildContext contex) {
                    return [
                      PopupMenuItem<PopupMenuChoices>(
                        height: 30,
                        enabled: false,
                        child: Center(
                            child: Text(
                          'Setting',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                      PopupMenuDivider(
                        height: 2,
                      ),
                      PopupMenuItem<PopupMenuChoices>(
                        height: 50,
                        value: PopupMenuChoices.url,
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "URL",
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.2,
                                ),
                                child: Icon(Icons.keyboard_arrow_right),
                              )
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<PopupMenuChoices>(
                        enabled: false,
                        height: 30,
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Version 1.2.43",
                                style: TextStyle(color: Colors.black),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/login.png',
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login Now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Please sign in to continue',
                      style: TextStyle(color: Colors.black)),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                    textEditingController: userIdController,
                    label: 'User ID',
                    iconPath: 'assets/icon/id.png',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                      textEditingController: passController,
                      label: 'Password',
                      iconPath: 'assets/icon/lock.png'),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      print('forgot password was tap');
                    },
                    child: Center(
                        child: Text(
                      'Forgot Password?',
                      style: Style.headingPrimaryTextStyle,
                    )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    color: Style.Colors.mainColor,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      await check();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          ' Sign up',
                          style: Style.headingPrimaryTextStyle,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  check() async {
    loading(
      context,
    );
    newLoginViewModel = Provider.of<NewLoginViewModel>(context, listen: false);
    await newLoginViewModel.checkLogin(
        this.userIdController.text, this.passController.text);
    var check = newLoginViewModel.check;
    if (check.orgId != "" && check.orgId != null) {
      if (check.orgId != '' &&
          check.userId != '' &&
          check.userType == "saleperson") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SyncData()));
      } else {
        getToast(context, 'Fail');
        Navigator.pop(context, true);
      }
    } else {
      getToast(context, 'Fail');
      Navigator.pop(context, true);
    }
  }

  getTextField(
      {TextEditingController textEditingController,
      String label,
      String iconPath}) {
    return TextFormField(
      style: TextStyle(),
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 15),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            15,
          ),
          child: ImageIcon(
            AssetImage(iconPath),
          ),
        ),
      ),
    );
  }

  onMenuSelection(PopupMenuChoices value) async {
    switch (value) {
      case PopupMenuChoices.url:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ChangeUrlPage();
          }),
        );
        break;

      default:
    }
  }
}

enum PopupMenuChoices { url }

class ChangeUrlPage extends StatefulWidget {
  @override
  _ChangeUrlPageState createState() => _ChangeUrlPageState();
}

class _ChangeUrlPageState extends State<ChangeUrlPage> {
  final _fomkey = GlobalKey<FormState>();
  TextEditingController urlController = TextEditingController();
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    if (urlController.text.isEmpty) {
      urlController.text =
          'http://52.253.88.71:8084/madbrepository/?fbclid=IwAR1Xrl508ZX3Cca714S5CcALeebob912uEWVfgMk9s60Z1YbCYqgSKIektY';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('URL'),
        centerTitle: true,
      ),
      body: Form(
        key: _fomkey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'URL',
                style: TextStyle(color: enable ? Colors.black : Colors.grey),
              ),
              TextField(
                enabled: enable,
                style: TextStyle(color: enable ? Colors.black : Colors.grey),
                controller: urlController,
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Style.Colors.mainColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Style.Colors.mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Style.Colors.mainColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  color: Style.Colors.mainColor,
                  onPressed: () {
                    changeUrl(enable);
                  },
                  child: Center(
                    child: Text(
                      enable ? 'Save' : 'Update',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  changeUrl(bool value) async {
    switch (value) {
      case true:
        Navigator.pop(context, true);
        break;

      case false:
        setState(() {
          enable = true;
        });
        break;
    }
  }
}
