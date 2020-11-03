import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String mainUrl = "http://52.255.142.115:8084/madbrepository/";

Future httpRequest(urlname, param) {
  var url = '$mainUrl' + urlname;
  return http
      .post(Uri.encodeFull(url), body: param, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      })
      .timeout(Duration(seconds: 20))
      .catchError((error) {
        print(error);
      });
}

Future<String> getOrgId(phNo, password) async {
  var param = jsonEncode({"userId": "$phNo", "password": "$password"}), check;

  final response = await httpRequest('main/logindebug/mit', param);

  if (response != null) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      if (data['orgId'] != "" && data['orgId'] != null) {
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
  return check;
}
