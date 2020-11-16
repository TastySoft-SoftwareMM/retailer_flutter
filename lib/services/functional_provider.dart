import 'package:flutter/material.dart';
import 'package:retailer/models/all_shop_saleList.dart';
import 'package:retailer/models/loginModel.dart';
import 'package:retailer/models/shopByListModel.dart';
import 'package:retailer/screens/user/syncData/toast.dart';
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
  login(String userId, String pass) async {
    var param = jsonEncode({"userId": '788571913', "password": '123'});
    final http.Response response =
        await httpRequest('main/logindebug/mit', param, '');
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      getLoginDetail = LoginModel.fromJson(result);
      statusCode = response.statusCode;
    } else {
      statusCode = response.statusCode;
    }

    notifyListeners();
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
    var param = jsonEncode({
      "userId": phone,
      "userName": userName,
      "password": pass,
      "passcode": ""
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
          .catchError((error) {
            print(error);
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AllShopSaleList> getMainScreenList(
      {String spsysKey,
      String teamsysKey,
      String userType,
      String date,
      String orgId}) async {
    var param = jsonEncode({
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
      throw Exception(response.statusCode);
    }
  }
}
