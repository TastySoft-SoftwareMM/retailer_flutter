class GetStock {
  final String code;
  final String desc;
  final String vendorSyskey;
  final String brandSyskey;
  final String orgId;
  final String categorySyskey;
  final String packTypeSyskey;
  final String packSizeSyskey;
  final String flavorSyskey;

  GetStock(
      {this.code,
        this.desc,
        this.vendorSyskey,
        this.brandSyskey,
        this.orgId,
        this.categorySyskey,
        this.packTypeSyskey,
        this.packSizeSyskey,
        this.flavorSyskey,
      });

  factory GetStock.fromJson(Map<String, dynamic> json) {
    return GetStock(

      code: json['code'],
      desc: json['desc'],
      vendorSyskey: json['vendorSyskey'],
      brandSyskey: json['brandSyskey'],
      orgId: json['orgId'],
      categorySyskey: json['categorySyskey'],
      packTypeSyskey: json['packTypeSyskey'],
      packSizeSyskey: json['packSizeSyskey'],
      flavorSyskey: json['flavorSyskey'],
    );
  }
}
