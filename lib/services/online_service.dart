import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retailer/models/all_shop_saleList.dart';
import 'package:retailer/models/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnlineService {
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
      print(e.errMsg());
    }
  }

  Future<LoginModel> getOrgId(phNo, password) async {
    var param = jsonEncode({"userId": "788571913", "password": "123"});

    final http.Response response =
        await httpRequest('main/logindebug/mit', param, '');
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      LoginModel getLoginDetail = LoginModel.fromJson(result);
      return getLoginDetail;
    } else {
      throw Exception("Failled to get top news");
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
