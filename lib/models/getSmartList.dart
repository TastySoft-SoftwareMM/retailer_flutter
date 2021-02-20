class GetSmartList{
   final String stockname;
   final String stocksyskey;
   final String stockImg;
   final String count;
   final String brandname;
   final String stockcode;

   GetSmartList({
     this.stockname,
     this.stocksyskey,
     this.stockImg,
     this.count,
     this.brandname,
     this.stockcode
});
   factory GetSmartList.fromJson(Map<String, dynamic> json) {
     return GetSmartList(
       stockname: json['stockname'],
       stocksyskey: json['stocksyskey'],
       stockImg: json['stockImg'],
       count: json['count'],
       brandname: json['brandname'],
       stockcode: json['stockcode'],
     );
   }
}