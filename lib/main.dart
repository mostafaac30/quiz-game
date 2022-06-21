import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test/page_turn.dart';
import 'package:test/pref/preferneces.dart';
import 'package:test/screens/gameplay.dart';
import 'package:test/screens/intro_screen.dart';
import 'package:test/widget/app_section.dart';
import 'package:test/widget/border._builder.dart';
import 'package:test/widget/text_iocn.dart';
import 'package:wave_transition/wave_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // This widget is the root of your application.
  var _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 0.34) {
// When it gets there hold it there.
        _controller.value = 0.34;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        // child: HomeScreen(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 54, 108, 1),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //background
            Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(3, 54, 108, 1),
                    Color.fromARGB(255, 10, 76, 133),
                    Color.fromRGBO(3, 54, 108, 1),
                  ])),
                )),
            //snow
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_kZx06J.json',
                // width: 200,
                ////screen hight media query
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
                // controller: _controller,
              ),
            ),
            //sound
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.01,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    //circle border
                    decoration: kInnerDecoration,
                    child: Row(
                      children: [
                        CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                        //الصوت
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        // text
                        Text(
                          'الصوت',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: kGradientBoxDecoration,
              ),
            ),
            Positioned(
              //at most right
              top: MediaQuery.of(context).size.height * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BorderBuilder(
                      child: TextWithIcon(
                    text: 'محمد',
                    icon: Icons.person,
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  BorderBuilder(
                    child: TextWithIcon(
                      text: '220',
                      iconImage: 'assets/coin.png',
                    ),
                    verticalPadding: 3,
                  ),
                ],
              ),
            ),
            //logo
            Positioned(
              //at top center
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/private_files/lf30_46kycmnm.json'),
            ),
            //option 1
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              child: AppSection(
                title: 'مسابقات حسب المستوى',
                onTap: () {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(
                    //   builder: (context) => GamePlay(),
                    // ),
                    WaveTransition(
                      child: IntroductionScreen(),
                      center: FractionalOffset(0.90, 0.90),
                    ),
                  );
                },
              ),
            ),
            //option 2
            Positioned(
              top: MediaQuery.of(context).size.height * 0.44,
              child: AppSection(
                title: 'مسابقات حسب الموضوعات',
                onTap: () {},
              ),
            ),
            //option 3
            Positioned(
              top: MediaQuery.of(context).size.height * 0.51,
              child: AppSection(
                title: 'مسابقات المعلمين لطلابهم',
                onTap: () {},
              ),
            ),
            //option 4
            Positioned(
              top: MediaQuery.of(context).size.height * 0.58,
              child: AppSection(
                title: 'اختِبار تَحديد المُستوى',
                onTap: () {},
              ),
            ),

            // ,
          ],
        ),
      ),
    );
  }
}
