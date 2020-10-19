import 'package:retailer/models/shop-user-response.dart';
import 'package:retailer/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetShopBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<ShopUserResponse> _subject =
      BehaviorSubject<ShopUserResponse>();

  getShopUser() async {
    // ShopUserResponse response = await _repository.getShopAll();
    // _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ShopUserResponse> get subject => _subject;
}

final shopuserbloc = GetShopBloc();
