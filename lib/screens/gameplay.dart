import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:test/model/qeustion.dart';
import 'package:test/pref/preferneces.dart';
import 'package:test/widget/question.dart';
import 'package:wave_transition/wave_transition.dart';

import '../widget/app_section.dart';
import '../widget/border._builder.dart';
import '../widget/text_iocn.dart';
import 'intro_screen.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  List<QeustionModel> questions = [
    QeustionModel(
      questionText: 'ما هي عاصمة مصر ؟',
      answerIndex: 0,
      answers: ['القاهرة', 'الجيزة', 'الأسكندرية', 'الإسماعيلية'],
      feedback: 'عاصمة مصر هي القاهرة',
    ),
  ];

  int selectedOption = -1;
  Color currentColor = Colors.transparent;
  bool onTap(
    int optionIndex,
  ) {
    setState(() {});
    selectedOption = optionIndex;
    if (optionIndex == questions[0].answerIndex) {
      currentColor = Colors.green;
      showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) {
            Future.delayed(Duration(milliseconds: 2500), () {
              Navigator.pop(context);
              selectedOption = -1;
            });
            return Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_lg6lh7fp.json',
              repeat: false,
              animate: true,
            );
          });
      return true;
    } else {
      currentColor = Colors.red;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 54, 108, 1),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FadeIn(
          child: Stack(
            children: [
              //background
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      mainColor,
                      Color.fromARGB(255, 10, 76, 133),
                      mainColor,
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
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
              //Question
              Positioned(
                top: MediaQuery.of(context).size.height * 0.32,
                child: Bounce(
                  child: QuestionBuilder(
                    title: questions[0].questionText,
                  ),
                ),
              ),
              //answers
              Positioned(
                top: MediaQuery.of(context).size.height * 0.46,
                child: BounceInDown(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap(0);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              //circle border
                              decoration: kInnerDecoration,
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // text
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.63,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: selectedOption == 0
                                          ? currentColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            // title
                                            questions[0].answers[0],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: kGradientBoxDecoration,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
              //option 2
              Positioned(
                top: MediaQuery.of(context).size.height * 0.53,
                child: BounceInLeft(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap(1);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              //circle border
                              decoration: kInnerDecoration,
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // text
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.63,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: selectedOption == 1
                                          ? currentColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            // title
                                            questions[0].answers[1],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: kGradientBoxDecoration,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
              //option 3
              Positioned(
                top: MediaQuery.of(context).size.height * 0.60,
                child: BounceInRight(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap(2);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              //circle border
                              decoration: kInnerDecoration,
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // text
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.63,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: selectedOption == 2
                                          ? currentColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            // title
                                            questions[0].answers[2],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: kGradientBoxDecoration,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
              //option 4
              Positioned(
                top: MediaQuery.of(context).size.height * 0.67,
                child: BounceInUp(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap(3);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              //circle border
                              decoration: kInnerDecoration,
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // text
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.63,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: selectedOption == 3
                                          ? currentColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            // title
                                            questions[0].answers[3],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: kGradientBoxDecoration,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.185,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),

              //feedback
              currentColor != Colors.transparent
                  ? Positioned(
                      top: MediaQuery.of(context).size.height * 0.8,
                      // left: MediaQuery.of(context).size.width * 0.05,
                      child: FadeInLeftBig(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: mainColor,
                            // borderRadius: BorderRadius.circular(20),
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: goldColor,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(questions[0].feedback,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : FadeOut(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
