// import 'package:flutter/material.dart';
// import 'package:retailer/models/shop-user-model.dart';
// import 'package:retailer/screens/main/visit-card.dart';
// import '../../style/theme.dart' as Style;
// import '../../custom/custom_expansion_title.dart' as custom;

// import 'package:retailer/repository/repository.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ShopListScreen extends StatefulWidget {
//   @override
//   _ShopListScreenState createState() => _ShopListScreenState();
// }

// class Item {
//   int _id;
//   String _name;

//   Item(this._id, this._name);

//   static List<Item> getItems() {
//     return <Item>[Item(1, "Check in"), Item(2, "Store closed")];
//   }
// }

// class _ShopListScreenState extends State<ShopListScreen> {
//   Future<ShopUserModel> shopuser;
//   final Repository _repository = Repository();
//   int _selectedvalue = 0;

//   List<Item> _items = Item.getItems();
//   List<DropdownMenuItem<Item>> _dropdownMenuItems;
//   Item _selectedItem;

//   @override
//   void initState() {
//     _dropdownMenuItems = buildDropDownMenuItems(_items);
//     _selectedItem = _dropdownMenuItems[0].value;
//     super.initState();
//   }

//   List<DropdownMenuItem<Item>> buildDropDownMenuItems(List items) {
//     List<DropdownMenuItem<Item>> litems = List();
//     for (Item item in items) {
//       litems.add(
//         DropdownMenuItem(value: item, child: Text(item._name)),
//       );
//     }
//     return litems;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: [
//         shopByUserWidget(context),
//         SizedBox(
//           height: 5.0,
//         ),
//         shopByTeamWidget()
//       ],
//     ));
//   }

//   Widget loadingWidget() {
//     return Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 25.0,
//               width: 25.0,
//               child: CircularProgressIndicator(
//                 valueColor:
//                     AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
//                 strokeWidth: 3.0,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget shopByUserWidget(context) {
//     return Card(
//       child: Container(
//         color: Style.Colors.dropBackgroundColor,
//         child: custom.ExpansionTitle(
//           // headerBackgroundColor: Color(0xFFCDD5D8),
//           headerBackgroundColor: Style.Colors.mainColor,
//           iconColor: Style.Colors.textColor,
//           title: Container(
//             child: Text(
//               "My list of stores for visit : 12/30",
//               style: TextStyle(color: Style.Colors.textColor),
//             ),
//           ),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Column(
//                 children: [
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         _onLoading();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         print("Hello");
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     "Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)",
//                                     style: Style.headingTextStyle),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: Text(
//                                   "Complete",
//                                   style: Style.statusSuccessTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                           subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "959423299996",
//                                   style: Style.secondTextStyle,
//                                 ),
//                                 Text(
//                                     "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n",
//                                     style: Style.secondTextStyle)
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         // child: ExpansionTile(
//         //   title: Text(
//         //     "My List of stores for visit",
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   children: [
//         //     Container(
//         //       height: 100,
//         //       width: 100,
//         //       color: Colors.grey,
//         //       child: Text("My List of stores for visit"),
//         //     ),
//         //   ],
//         // ),
//       ),
//     );
//   }

//   Widget checkInDialog() {
//     return AlertDialog(
//       elevation: 5.0,
//       actions: [
//         SizedBox(
//           // width: 100,
//           // height: 40,
//           child: FlatButton(
//             // borderSide: BorderSide(color: Style.Colors.mainColor),
//             child:
//                 Text("Cancel", style: TextStyle(color: Style.Colors.iconColor)),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         // Spacer(),
//         // SizedBox(
//         //   width: 10,
//         // ),
//         SizedBox(
//           // width: 100,
//           // height: 40,
//           child: FlatButton(
//             // borderSide: BorderSide(color: Style.Colors.mainColor),
//             child: Text("Start"),
//             onPressed: () {
//               _onLoading();
//               // Navigator.pop(context);
//             },
//           ),
//         ),
//         Spacer()
//       ],
//       content: Container(
//         height: MediaQuery.of(context).size.height - 250,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text("Check In",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ListTile(
//                   leading: SvgPicture.asset(
//                     "assets/shop.svg",
//                     width: 20,
//                   ),
//                   title: Expanded(
//                       child: Text(
//                     "Aung Mi Thar Su (အောင်​မိသားစု)",
//                     style: TextStyle(height: 1.2),
//                   )),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.access_time),
//                   title: Text("28/07/2020-1:08 PM"),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.location_on),
//                   title: Text(
//                     "22.3455434 / 94.323232",
//                     style: TextStyle(color: Style.Colors.mainColor),
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.apps),
//                   title: Container(
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton(
//                         value: _selectedItem,
//                         items: _dropdownMenuItems,
//                         onChanged: onChangedDropDownItem,
//                       ),
//                     ),
//                     //   child: DropdownButton(
//                     //       hint: Text("Select a type"),
//                     //       isExpanded: true,
//                     //       value: _selectedvalue,
//                     //       items: [
//                     //         DropdownMenuItem(
//                     //           child: Text("Check in"),
//                     //           value: 1,
//                     //         ),
//                     //         DropdownMenuItem(
//                     //           child: Text("Store closed"),
//                     //           value: 2,
//                     //         ),
//                     //       ],
//                     //       onChanged: (value) {
//                     //         print(value);
//                     //         setState(() {
//                     //           this._selectedvalue = value;
//                     //         });
//                     //       }),
//                     // ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: SvgPicture.asset(
//                     "assets/address.svg",
//                     width: 20.0,
//                   ),
//                   title: Text(
//                       "လမ်း80.34.35ကြား, ကဉ္စနမဟီရပ်ကွက်, ချမ်းအေးသာဇံ, ချမ်းအေးသာစံ, မန္တလေးခရိုင်, မန္တလေးတိုင်းဒေသကြီး\r\n"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _onLoading() {
//     showDialog(
//       context: context,
//       barrierColor: Colors.black12,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           child: new Center(
//             child: new CircularProgressIndicator(
//                 // backgroundColor: Colors.black12,
//                 valueColor:
//                     AlwaysStoppedAnimation<Color>(Style.Colors.mainColor)),
//           ),
//         );
//       },
//     );

//     new Future.delayed(new Duration(seconds: 1), () {
//       Navigator.pop(context);
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => VisitCard()));
//     });
//   }

//   onChangedDropDownItem(Item selectedItem) {
//     setState(() {
//       _selectedItem = selectedItem;
//     });
//   }

//   Widget shopByTeamWidget() {
//     return Card(
//           child: Container(
//         color: Style.Colors.dropBackgroundColor,
//         child: custom.ExpansionTitle(
//           headerBackgroundColor: Style.Colors.mainColor,
//           iconColor: Style.Colors.textColor,
//           title: Container(
//             child: Text(
//               "Other list John Doe:",
//               style: TextStyle(color: Style.Colors.textColor),
//             ),
//           ),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Column(
//                 children: [
//                   Card(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: () {
//                         print("Hello");
//                       },
//                       child: ListTile(
//                         title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                         subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text("959423299996"),
//                               Text("No1. .....str ......road")
//                             ]),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Shwe Myint Mo (CATZ) (ရွှေမြင့်မိုရ်)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Malar Myaing (မာလာမြိုင်​)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                   Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text("Aung Mi Thar Su (အောင်​မိသားစု)"),
//                       subtitle: Text("959423299996"),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         // child: ExpansionTile(
//         //   title: Text(
//         //     "My List of stores for visit",
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   children: [
//         //     Container(
//         //       height: 100,
//         //       width: 100,
//         //       color: Colors.grey,
//         //       child: Text("My List of stores for visit"),
//         //     ),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }
