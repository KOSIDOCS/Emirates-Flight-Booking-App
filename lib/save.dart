//Saved here for reference on working with listView and ScrollchildView hieght.
// import 'package:flutter/material.dart';
// import 'package:emirates_app/constants.dart';
// import 'display/title.dart';
// // import 'package:emirates_app/display/select_bar.dart';
// // import 'package:flutter_icons/flutter_icons.dart';

// class AddFlightScreen extends StatefulWidget {
//   static const String id = 'add_flight_screen';
//   @override
//   _AddFlightScreenState createState() => _AddFlightScreenState();
// }

// class _AddFlightScreenState extends State<AddFlightScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                 // BuildHead(),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                 Align(
//                     alignment: Alignment(-0.9, 0),
//                     child: HeadTitle(title: 'Add flight')),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                 _buildBody(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(right: 30.0, bottom: 20.0),
//         child: FloatingActionButton(
//           child: Icon(
//             Icons.chevron_right_outlined,
//             size: 35.0,
//             color: kMainColor,
//           ),
//           onPressed: () {
//             // Navigator.pushNamed(context, AddFlightScreen.id);
//           },
//           tooltip: 'Add new tasks',
//           elevation: 2.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.0),
//               topRight: Radius.circular(16.0),
//               bottomLeft: Radius.circular(15.0),
//               bottomRight: Radius.circular(15.0),
//             ),
//           ),
//           backgroundColor: kFloatingButton,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//     );
//   }

//   Widget _buildBody() {
//     return Expanded(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         // padding: EdgeInsets.symmetric(horizontal: 32),
//         decoration: BoxDecoration(
//           color: kMainColor,
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(32),
//           ),
//         ),
//         child: Column(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: new Row(
//                 children: <Widget>[
//                   Container(
//                     width: 160.0,
//                     height: 40.0,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     width: 160.0,
//                     height: 40.0,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 160.0,
//                     height: 40.0,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     width: 160.0,
//                     height: 40.0,
//                     color: Colors.yellow,
//                   ),
//                   Container(
//                     width: 160.0,
//                     height: 40.0,
//                     color: Colors.orange,
//                   ),
//                   // ...
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               height: 130.0,
//               child: ListView(
//                 // This next line does the trick.
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   // Container(
//                   //   width: 160.0,
//                   //   color: Colors.red,
//                   // ),
//                   // Container(
//                   //   width: 160.0,
//                   //   color: Colors.blue,
//                   // ),
//                   // Container(
//                   //   width: 160.0,
//                   //   color: Colors.green,
//                   // ),
//                   // Container(
//                   //   width: 160.0,
//                   //   color: Colors.yellow,
//                   // ),
//                   // Container(
//                   //   width: 160.0,
//                   //   color: Colors.orange,
//                   // ),
//                   flightDays(),
//                   flightDays(),
//                   flightDays(),
//                   flightDays(),
//                   flightDays(),
//                   flightDays(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget flightDays() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 6.0),
//       // height: 20.0,
//       width: 100.0,
//       padding: EdgeInsets.symmetric(horizontal: 32),
//       decoration: BoxDecoration(
//         color: kMainColor,
//         border: Border.all(
//           width: 1,
//           color: Colors.white,
//         ),
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//           bottom: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: [
//           Text('Mon', style: kTextStyle),
//           Text('14', style: kTextStyle),
//         ],
//       ),
//     );
//   }
// }
