import 'package:flutter/material.dart';
import 'package:retailer/models/all_shop_saleList.dart';
import 'package:retailer/models/loginModel.dart';
import 'package:retailer/models/shopByListModel.dart';
import 'package:retailer/screens/user/syncData/toast.dart';
import 'package:retailer/services/online_service.dart';

class ViewModelFunction with ChangeNotifier {
  LoginModel check;
  AllShopSaleList allShopSaleList;
  List<ShopByListM> shopsByTeam;
  List<ShopByListM> shopsByUser;

  checkLogin(String userId, String pass) async {
    this.check = await OnlineService()
        .getOrgId(userId, pass)
        .timeout(Duration(seconds: 5), onTimeout: () {
      return null;
    });

    notifyListeners();
  }

  getMainList() async {
    this.allShopSaleList = await OnlineService().getMainScreenList(
        spsysKey: check.syskey,
        teamsysKey: check.teamSyskey,
        userType: check.userType,
        date: getDate,
        orgId: check.orgId);
    this.shopsByTeam = allShopSaleList.shopsByTeam
        .map((e) => ShopByListM.fromJson(e))
        .toList();
    this.shopsByUser = allShopSaleList.shopsByUser
        .map((e) => ShopByListM.fromJson(e))
        .toList();
    notifyListeners();
  }
}
