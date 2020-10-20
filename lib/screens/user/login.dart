import 'package:flutter/material.dart';
import 'package:retailer/screens/main/main-screen.dart';
import 'package:retailer/screens/user/sign_up.dart';
import '../../style/theme.dart' as Style;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    print('setting was tap');
                  },
                )
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
                      textEditingController: userIdController,
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
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
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

  getTextField(
      {TextEditingController textEditingController,
      String label,
      String iconPath}) {
    return TextFormField(
      style: TextStyle(),
      obscureText: true,
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
}
