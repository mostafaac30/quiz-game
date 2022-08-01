// import 'package:better_page_turn/better_page_turn.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:test/main.dart';
// import 'package:test/screens/gameplay.dart';

// import '../splash.dart';

// void main() {
//   runApp(
//     CupertinoApp(
//       home: CupertinoPageScaffold(
//         child: SafeArea(
//           child: MyApp(),
//         ),
//       ),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   HorizontalFlipPageTurnController horizontalFlipPageTurnController =
//       HorizontalFlipPageTurnController();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: Wrap(
//         children: [
//           Container(
//             child: Padding(
//               padding: EdgeInsets.zero,
//               child: LayoutBuilder(builder: (context, constraints) {
//                 return HorizontalFlipPageTurn(
//                   children: [
//                     SplashScreen(),
//                     Container(
//                       color: Colors.red,
//                       child: Center(
//                         child: Text('1'),
//                       ),
//                     ),
// //                     Container(
// //                       color: Colors.white,
// //                       child: Center(
// //                           child: Html(
// //                         data: """
// // <body style="color: rgb(192, 27, 27); background-color: rgb(255, 255, 255);">
// //     <p><strong><span style='font-family: "Courier New", courier; font-size: 28px;'>هَذِهِ</span></strong><span style='font-family: "Courier New", courier; font-size: 28px;'> اللغةُ </span><span style='font-size: 28px; color: rgb(97, 189, 109); font-family: "Courier New", courier;'>العَرَبِيةٌ</span></p>
// // </body>
// // """,
// //                       )),
// //                     ),
//                   ],
//                   cellSize: Size(constraints.maxWidth, 600),
//                   controller: horizontalFlipPageTurnController,
//                 );
//               }),
//             ),
//           ),
//           CupertinoButton(
//             child: Text("turn left"),
//             onPressed: () {
//               horizontalFlipPageTurnController.animToLeftWidget(
//                   duration: Duration(milliseconds: 500));
//             },
//           ),
//           CupertinoButton(
//             child: Text("turn right"),
//             onPressed: () {
//               horizontalFlipPageTurnController.animToRightWidget(
//                   duration: Duration(milliseconds: 500));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWidget(int position, Color color) {
//     return Container(
//       color: color,
//       constraints: BoxConstraints.expand(),
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Text(
//               "0x${position.toRadixString(16).toUpperCase()}",
//               style: TextStyle(
//                 color: Color(0xFF2e282a),
//                 fontSize: 40.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
