// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'dart:ui' as ui;

// import 'package:flutter/rendering.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       value: 1,
//       duration: const Duration(milliseconds: 1000),
//       animationBehavior: AnimationBehavior.preserve,
//       vsync: this,
//     );

//     Future.delayed(
//       Duration(seconds: 2),
//       () {
//         _onTap();
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   void _onTap() {
//     if (_controller?.status == AnimationStatus.dismissed ||
//         _controller?.status == AnimationStatus.reverse) {
//       _controller?.forward();

//       print('forward');
//       print(_controller);
//     } else {
//       print('reverse');
//       _controller?.reverse();
//       print(_controller);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white54,
//       body: SafeArea(
//         child: GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: _onTap,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Stack(
//               children: [
//                 //background
//                 Positioned(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                           Color.fromRGBO(3, 54, 108, 1),
//                           Color.fromARGB(255, 10, 76, 133),
//                           Color.fromRGBO(3, 54, 108, 1),
//                         ]),
//                       ),
//                     )),
//                 //snow

//                 // ,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
