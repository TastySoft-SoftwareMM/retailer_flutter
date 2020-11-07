import 'package:flutter/material.dart';
import 'package:retailer/models/loginModel.dart';
import 'package:retailer/screens/user/syncData/toast.dart';
import 'package:retailer/services/online_service.dart';

class NewLoginViewModel with ChangeNotifier {
  LoginModel check;

  checkLogin(String userId, String pass) async {
    this.check = await OnlineService().getOrgId(userId, pass);

    notifyListeners();
  }

  getMainList() async {
    this.check = await OnlineService().getMainScreenList(
      spsysKey: check.syskey,
      teamsysKey: check.teamSyskey,
      userType: check.userType,
      date: getDate,
    );
    notifyListeners();
  }
}
