import 'package:flutter/material.dart';
import 'package:retailer/models/all_shop_saleList.dart';
import 'package:retailer/models/loginModel.dart';
import 'package:retailer/models/shopByListModel.dart';
import 'package:retailer/screens/public/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewModelFunction with ChangeNotifier {
  LoginModel getLoginDetail;
  AllShopSaleList allShopSaleList;
  List<ShopByListM> shopsByTeam;
  List<ShopByListM> shopsByUser;
  int statusCode;
  String signUpDetail;
  String status;
  String param;
  dynamic result;
  login(String userId, String pass) async {
    param = jsonEncode({"userId": '$userId', "password": '$pass'});
    final http.Response response =
        await httpRequest('main/logindebug/mit', param, '');
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      getLoginDetail = LoginModel.fromJson(result);
      print(result);
      print(getLoginDetail.password);
      statusCode = response.statusCode;
    } else {
      statusCode = response.statusCode;
    }
    notifyListeners();
  }

  resetPassword(String currentPass, String newpass) async {
    param = jsonEncode({
      "id": getLoginDetail.userId,
      "oldpass": '$currentPass',
      "newpass": '$newpass'
    });
    final http.Response response =
        await httpRequest('main/reset/mit', param, getLoginDetail.orgId);
    if (response.statusCode == 200) {
      result = json.decode(response.body);

      statusCode = response.statusCode;
      status = result['status'];
      // if (status == "SUCCESS!") {
      //   getLoginDetail = null;
      //   allShopSaleList = null;
      //   shopsByTeam = null;
      //   shopsByUser = null;
      //   statusCode = null;

      // }
    } else {
      statusCode = response.statusCode;
    }
    notifyListeners();
  }

  shopTransfer(String shopSysKey, String teamSysKey) async {
    param = jsonEncode({
      "date": "$getDate",
      "t1": "",
      "userSyskey": getLoginDetail.syskey,
      "shopSyskey": "$shopSysKey",
      "n1": "$teamSysKey",
      "n2": "",
      "n3": ""
    });
    final http.Response response = await httpRequest(
        'shopPerson/insertUJUN002/', param, getLoginDetail.orgId);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      status = result['status'];
      statusCode = response.statusCode;
    } else {
      statusCode = response.statusCode;
    }
  }

  getMainList() async {
    this.allShopSaleList = await getMainScreenList(
            spsysKey: getLoginDetail.syskey,
            teamsysKey: getLoginDetail.teamSyskey,
            userType: getLoginDetail.userType,
            date: getDate,
            orgId: getLoginDetail.orgId)
        .timeout(Duration(seconds: 8), onTimeout: () {
      return null;
    });
    this.shopsByTeam = allShopSaleList.shopsByTeam
        .map((e) => ShopByListM.fromJson(e))
        .toList();
    this.shopsByUser = allShopSaleList.shopsByUser
        .map((e) => ShopByListM.fromJson(e))
        .toList();
    notifyListeners();
  }

  signUp(
    String userName,
    String phone,
    String pass,
  ) async {
    param = jsonEncode({
      "userId": phone,
      "userName": userName,
      "password": pass,
      "passcode": getLoginDetail.orgId
    });
    final http.Response response =
        await httpRequest('main/signup/mit', param, '');
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      signUpDetail = result['message'];
      statusCode = response.statusCode;
    } else {
      statusCode = response.statusCode;
    }

    notifyListeners();
  }

  String mainUrl = "http://52.255.142.115:8084/madbrepository/"; //default link

  Future httpRequest(urlname, param, String ordId) async {
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
            "Content-Type": "application/json",
            "Content-Over": "$ordId",
          })
          .timeout(Duration(seconds: 20))
          .catchError((error) {});
    } catch (e) {
      return null;
    }
  }

  Future<AllShopSaleList> getMainScreenList(
      {String spsysKey,
      String teamsysKey,
      String userType,
      String date,
      String orgId}) async {
    param = jsonEncode({
      "spsyskey": "$spsysKey",
      "teamsyskey": "$teamsysKey",
      "usertype": "$userType",
      "date": "$date",
    });

    final http.Response response =
        await httpRequest('shop/getshopall', param, orgId);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      AllShopSaleList allShopSaleList = AllShopSaleList.fromJson(result);
      return allShopSaleList;
    } else {
      throw Exception(response);
    }
  }
}
