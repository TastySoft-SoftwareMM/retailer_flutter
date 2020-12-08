// import 'package:flutter/material.dart';
// import 'package:retailer/style/theme.dart' as Style;

// class TestMainScreen extends StatefulWidget {
//   @override
//   _TestMainScreenState createState() => _TestMainScreenState();
// }

// class _TestMainScreenState extends State<TestMainScreen> {
//   final List data = ["Baked goods", "Lotte", "Soft drinks and others", "DD"];

//   List<String> mainList = [
//     'Sp_Blueberry Cream Roll',
//     'Blueberry Cream ',
//     'Long Bread',
//     'Short Bread',
//     'Example Bread',
//     'Super Cream Bread',
//     'small Cream Bread',
//     'No  Cream Bread',
//     'Stawbarry Cream',
//     'simple bread',
//   ];

//   TextEditingController qtyController = TextEditingController();

//   TextEditingController expQtyController = TextEditingController();
//   var secWidth;
//   var width;
//   @override
//   Widget build(BuildContext context) {
//     secWidth = MediaQuery.of(context).size.width * 0.7;
//     width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Stocks"),
//         leading: IconButton(
//             icon: Icon(
//               Icons.accessible_forward_outlined,
//               color: Colors.white,
//             ),
//             onPressed: () {}),
//       ),
//       body: getMainExpansion(),
//     );
//   }

//   Widget getMainExpansion() {
//     return ListView.builder(
//       itemBuilder: (context, index) => ExpansionTile(
//         backgroundColor: Colors.blue,
//         title: Text(data[index]),
//         children: [
//           getSubTile(),
//           getSub(),
//           getMain(),
//         ],
//       ),
//       itemCount: data.length,
//     );
//   }

//   Widget getSubTile() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => ExpansionTile(
//         backgroundColor: Colors.green,
//         title: Text("Baked goods"),
//         subtitle: Text(" Bread"),
//         children: [
//           getChildren(),
//         ],
//       ),
//       itemCount: data.length,
//     );
//   }

//   Widget getSub() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => ExpansionTile(
//         backgroundColor: Colors.green,
//         title: Text("Prastries"),
//         // subtitle: Text("  "),
//         children: [
//           getChildren(),
//         ],
//       ),
//       itemCount: data.length,
//     );
//   }

//   Widget getMain() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => ExpansionTile(
//         backgroundColor: Colors.green,
//         title: Text("Cake"),
//         children: [
//           getChildren(),
//         ],
//       ),
//       itemCount: data.length,
//     );
//   }

//   Widget getChildren() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           tileColor: Colors.white,
//           title: Text(""),
//         ),
//       ),
//       itemCount: data.length,
//     );
//   }

//   Widget getStockList() {
//     return ListView.builder(
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.only(left: 4),
//         child: Container(
//           height: 110,
//           child: Row(
//             children: [
//               Container(
//                 width: width * 0.25,
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Image.asset(
//                       'assets/icon/sp_bread1.jpg',
//                       height: 100,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 110,
//                 width: width * 0.73,
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Spacer(),
//                       Spacer(),
//                       Container(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 4, right: 4, top: 4),
//                               child: Container(
//                                   width: secWidth * 0.8,
//                                   child: Text(
//                                     mainList[index],
//                                     maxLines: 3,
//                                     overflow: TextOverflow.clip,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       height: 1,
//                                     ),
//                                   )),
//                             ),
//                             Spacer(),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(right: 10, top: 10),
//                               child: InkWell(
//                                 onTap: () {
//                                   print('delete was tap');
//                                 },
//                                 child: ImageIcon(
//                                   AssetImage('assets/icon/delete.png'),
//                                   size: 23,
//                                   color: Style.Colors.mainColor,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: secWidth * 0.45,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Container(
//                                     height: 40,
//                                     width: secWidth * 0.08,
//                                     child: FittedBox(
//                                       fit: BoxFit.fitWidth,
//                                       child: Text(
//                                         "Qty",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   width: secWidth * 0.35,
//                                   child: Card(
//                                     color: Colors.grey[50],
//                                     elevation: 0,
//                                     child: Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             print('minus one was tap');
//                                           },
//                                           child: Container(
//                                             height: 40,
//                                             width: secWidth * 0.1,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8,
//                                                   top: 8,
//                                                   bottom: 8,
//                                                   left: 4),
//                                               child: ImageIcon(
//                                                 AssetImage(
//                                                     'assets/icon/minus.png'),
//                                                 color: Style.Colors.mainColor,
//                                                 size: 16,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(bottom: 5),
//                                           child: Container(
//                                             width: secWidth * 0.1,
//                                             child: TextField(
//                                               style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w500),
//                                               controller: qtyController,
//                                               textAlign: TextAlign.center,
//                                               decoration: InputDecoration(
//                                                 contentPadding:
//                                                     EdgeInsets.only(bottom: 14),
//                                                 border: InputBorder.none,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             print('object');
//                                           },
//                                           child: Container(
//                                             height: 40,
//                                             width: secWidth * 0.1,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8, top: 10, bottom: 10),
//                                               child: ImageIcon(
//                                                 AssetImage(
//                                                     'assets/icon/add.png'),
//                                                 color: Style.Colors.mainColor,
//                                                 size: 16,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 50,
//                             width: secWidth * 0.55,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Container(
//                                     height: 40,
//                                     width: secWidth * 0.16,
//                                     child: FittedBox(
//                                       fit: BoxFit.fitWidth,
//                                       child: Text(
//                                         "Exp qty",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   width: secWidth * 0.35,
//                                   child: Card(
//                                     color: Colors.grey[50],
//                                     elevation: 0,
//                                     child: Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             print('minus two was tap');
//                                           },
//                                           child: Container(
//                                             height: 40,
//                                             width: secWidth * 0.1,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8,
//                                                   top: 8,
//                                                   bottom: 8,
//                                                   left: 4),
//                                               child: ImageIcon(
//                                                 AssetImage(
//                                                     'assets/icon/minus.png'),
//                                                 color: Style.Colors.mainColor,
//                                                 size: 16,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(bottom: 5),
//                                           child: Container(
//                                             width: secWidth * 0.1,
//                                             child: TextField(
//                                               style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w500),
//                                               controller: qtyController,
//                                               textAlign: TextAlign.center,
//                                               decoration: InputDecoration(
//                                                 contentPadding:
//                                                     EdgeInsets.only(bottom: 14),
//                                                 border: InputBorder.none,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             print('plus two was tap ');
//                                           },
//                                           child: Container(
//                                             height: 40,
//                                             width: secWidth * 0.1,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 8, top: 10, bottom: 10),
//                                               child: ImageIcon(
//                                                 AssetImage(
//                                                     'assets/icon/add.png'),
//                                                 color: Style.Colors.mainColor,
//                                                 size: 16,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       itemCount: mainList.length,
//     );
//   }
// }
