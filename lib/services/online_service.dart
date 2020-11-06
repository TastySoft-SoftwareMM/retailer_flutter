import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retailer/models/loginModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnlineService {
  String mainUrl = "http://52.255.142.115:8084/madbrepository/"; //default link

  Future httpRequest(urlname, param) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      var mainUrlDynamic = preferences.getString('mainurl'), url;

      if (mainUrlDynamic == null) {
        url = '$mainUrl' + urlname;
      } else {
        url = '$mainUrlDynamic' + urlname;
      }

      return http
          .post(Uri.encodeFull(url), body: param, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          })
          .timeout(Duration(seconds: 20))
          .catchError((error) {
            print('time out');
            print('error');
          });
    } catch (e) {
      print(e.errMsg());
    }
  }

  Future<String> getOrgId(phNo, password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var param = jsonEncode({"userId": "$phNo", "password": "$password"}), check;

    final response = await httpRequest('main/logindebug/mit', param);

    if (response != null) {
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        var changeRes = LoginModel.fromJson(result);
        if (changeRes.orgId != "" && changeRes.orgId != null) {
          if (changeRes.orgId != '' &&
              changeRes.userId != '' &&
              changeRes.userType == "saleperson") {
            preferences.setString('orgId', changeRes.orgId);
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
}
