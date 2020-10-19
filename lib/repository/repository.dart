import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retailer/models/shop-user-model.dart';
import 'package:http/http.dart';

class Repository {
  static String mainUrl = "http://52.255.142.115:8084/madbrepository/";
  var getShopUrl = '$mainUrl/shop/getshopall';

  Map<String, String> options = {
    'Accept': 'text/html,application/json',
    'Content-Type': 'application/json',
    'Content-Over':
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNSVQiLCJ1aWQiOiI5NTk3ODg1NzE5MTMiLCJ1bmFtZSI6IlB5YWUgU29uZSBXaW4iLCJ1c2siOiIyMDA2MjYwMjEyMzk0MzAwMzc0Iiwib2lkIjoiMDAxIiwiaWF0IjoxNTk1ODMzMzE4LCJleHAiOjE1OTU5MTk3MTgsImp0aSI6ImExMGE3ZjVhLWZiNjctNDg5Mi1hMmRkLTkwM2EwODExYjAzZiJ9.qL1sLQx4eKe8ck34LCjtU0fmqcUGbf5_uZSc_SYTeck"
  };
  Future<List<ShopUserModel>> getShopAll() async {
    List<ShopUserModel> list;
    var params = {
      "spsyskey": "2006260212394300374",
      "teamsyskey": "2006261557087200418",
      "usertype": "saleperson",
      "date": "20200727"
    };
    var response =
        await post(getShopUrl, body: jsonEncode(params), headers: options);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"]["shopsByUser"] as List;
      list = rest
          .map<ShopUserModel>((json) => ShopUserModel.fromJson(json))
          .toList();
      return list;
    } else {
      throw "Can't get posts";
    }
  }
}
