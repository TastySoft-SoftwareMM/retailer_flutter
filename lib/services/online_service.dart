import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String mainUrl = "http://52.255.142.115:8084/madbrepository/";

Future<String> getOrgId(phNo, password) async {
  var check;
  var url = '$mainUrl' + 'main/logindebug/mit';
  var param = jsonEncode({"userId": "$phNo", "password": "$password"});

  final response = await http
      .post(Uri.encodeFull(url), body: param, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      })
      .timeout(Duration(seconds: 20))
      .catchError((error) {
        check = 'fail';
        print(error);
      });

  print(response);
  if (response != null) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      if (data['orgId'] != "" && data['orgId'] != null) {
        if (data['userId'].substring(3) != preferences.getString("userId")) {}
        if (data['orgId'] != '' &&
            data['userId'] != '' &&
            data['userType'] == "saleperson") {
          check = 'success';
        } else {
          check = 'fail';
        }
      } else {
        check = 'fail';
      }
    } else {
      print(response.statusCode);
      check = "Server Error " + response.statusCode.toString() + " !";
    }
  } else {
    check = 'Connection Fail!';
  }

  print("check ---- " + check);
  return check;
}
