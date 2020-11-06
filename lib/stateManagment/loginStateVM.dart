import 'package:flutter/material.dart';
import 'package:retailer/services/online_service.dart';

class NewLoginViewModel with ChangeNotifier {
  String check;

  checkLogin(String userId, String pass) async {
    this.check = await OnlineService().getOrgId(userId, pass);

    notifyListeners();
  }
}
