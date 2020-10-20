import 'package:flutter/material.dart';
import 'package:retailer/screens/main/main-screen.dart';
import '../../style/theme.dart' as Style;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController comfirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                      textEditingController: nameController,
                      label: 'Name',
                      iconPath: 'assets/icon/user.png'),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                    textEditingController: phNumberController,
                    label: 'Phone number',
                    iconPath: 'assets/icon/contact.png',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                    textEditingController: passwordController,
                    label: 'Password',
                    iconPath: 'assets/icon/lock.png',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  getTextField(
                      textEditingController: comfirmpasswordController,
                      label: 'Comfirm Password',
                      iconPath: 'assets/icon/lock.png'),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    color: Style.Colors.mainColor,
                    child: Center(
                      child: Text(
                        'SIGN UP',
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
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          ' Login now',
                          style: Style.headingPrimaryTextStyle,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            )
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
      obscureText: true,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 15),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            18,
          ),
          child: ImageIcon(
            AssetImage(iconPath),
          ),
        ),
      ),
    );
  }
}
