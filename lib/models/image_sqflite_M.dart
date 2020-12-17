class Photo {
  int _id;
  String _photo;
  String _shopSysKey;
  Photo(this._photo, this._shopSysKey);

  Photo.withId(this._id, this._photo, this._shopSysKey);
  int get id => _id;
  String get photo => _photo;
  String get shopSysKey => _shopSysKey;
  set getPhoto(String newPhoto) {
    this._photo = newPhoto;
  }

  set getshopSysKey(String newshopSysKey) {
    this._shopSysKey = newshopSysKey;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['photo'] = _photo;
    map['shopSysKey'] = _shopSysKey;
    return map;
  }

  Photo.formMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._photo = map['photo'];
    this._shopSysKey = map['shopSysKey'];
  }
}
