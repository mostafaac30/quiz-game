import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:test/main.dart';
import 'package:test/model/qeustion.dart';
import 'package:test/preferneces/preferneces.dart';
import 'package:test/screens/intro_screen.dart';
import 'package:test/widget/question.dart';
import 'package:wave_transition/wave_transition.dart';

import '../widget/app_section.dart';
import '../widget/border._builder.dart';
import '../widget/text_iocn.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

enum AnswerState {
  correct,
  wrong,
}

class _GamePlayState extends State<GamePlay>
    with SingleTickerProviderStateMixin {
  int selectedOption = -1;
  Color currentColor = Colors.transparent;
  var _controller;

  bool onTap(
    int optionIndex,
  ) {
    setState(() {});
    selectedOption = optionIndex;
    if (optionIndex == questions[questionIndex].answerIndex) {
      currentColor = Colors.green;
      coinsCount += 100;
      playClickSound(AnswerState.correct);
      showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) {
            Future.delayed(Duration(milliseconds: 2500), () {
              _controller.value = 0.0; //rest coins animation

              Navigator.pop(context);
              selectedOption = -1;
              currentColor = Colors.transparent;
              // setState(() {});
            });
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.045,
                    right: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.network(
                      'https://assets6.lottiefiles.com/packages/lf20_bRNzlt.json',
                      repeat: false,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller.value = 0.16;
                        _controller
                          ..duration = composition.duration
                          ..repeat();
                      },
                    ),
                  ),
                  Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_lg6lh7fp.json',
                    repeat: false,
                    animate: true,
                  ),
                ],
              ),
            );
          });

      return true;
    } else {
      playClickSound(AnswerState.wrong);
      currentColor = Colors.red;
      return false;
    }
  }

  final player = AudioPlayer();

  Future<void> playClickSound(AnswerState state) async {
    if (state == AnswerState.correct) {
      await player.play(
        AssetSource('audio/correct.mp3'),
      );
    } else {
      await player.play(
        AssetSource('audio/wrong.wav'),
      );
    }
  }

  final controller = StoryController();
  List<StoryItem> storyItems = [
    StoryItem.text(
      title: questions[questionIndex].feedback,
      backgroundColor: mainColor,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      duration: Duration(seconds: 5),
    ),
  ]; // your list of stories

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 0.34) {
// When it gets there hold it there.
        _controller.value = 0.34;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEnabled = (currentColor == Colors.transparent);

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 54, 108, 1),
      body: SafeArea(
        child: SizedBox(
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
                        Color.fromRGBO(3, 54, 108, 1),
                        Color.fromARGB(255, 10, 76, 133),
                        Color.fromRGBO(3, 54, 108, 1),
                      ]),
                    ),
                  ),
                ),
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
                //coinsCount and player name
                Positioned(
                  //at most right
                  top: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.width * 0.01,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BorderBuilder(
                          child: TextWithIcon(
                        text: 'أحمد',
                        iconImage: 'assets/person.png',
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      BorderBuilder(
                        child: TextWithIcon(
                          text: '$coinsCount',
                          iconImage: 'assets/coin.png',
                          isIcon: false,
                        ),
                        verticalPadding: 3,
                      ),
                    ],
                  ),
                ),

                //Question
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.32,
                  child: Bounce(
                    child: QuestionBuilder(
                      title: questions[questionIndex].questionText,
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
                          onTap: isEnabled
                              ? () async {
                                  onTap(0);
                                }
                              : null,
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
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              '${questions[questionIndex].answers[0]} ',

                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                letterSpacing: 0.0,
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textDirection: TextDirection.rtl,
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
                          onTap: isEnabled
                              ? () {
                                  onTap(1);
                                }
                              : null,
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
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              '${questions[questionIndex].answers[1]}   ',
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
                          onTap: isEnabled
                              ? () {
                                  onTap(2);
                                }
                              : null,
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
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              '${questions[questionIndex].answers[2]}   ',
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
                          onTap: isEnabled
                              ? () {
                                  onTap(3);
                                }
                              : null,
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
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              '${questions[questionIndex].answers[3]}  ',
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
                        top: MediaQuery.of(context).size.height * 0.78,
                        // left: MediaQuery.of(context).size.width * 0.05,
                        child: FadeInLeftBig(
                          child: Container(
                            // padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
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
                            child: StoryView(
                              progressPosition: ProgressPosition.bottom,
                              controller:
                                  controller, // pass controller here too
                              repeat:
                                  false, // should the stories be slid forever
                              // onStoryShow: (s) {notifyServer(s);},
                              onComplete: () {
                                print('Completed $questionIndex');

                                if (questionIndex == questions.length - 1) {
                                  showDialog(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      builder: (context) {
                                        Future.delayed(
                                            Duration(milliseconds: 3500), () {
                                          questionIndex = 0;
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ),
                                          );
                                        });
                                        return ZoomIn(
                                          child: Lottie.network(
                                            'https://assets3.lottiefiles.com/packages/lf20_ss4ziR.json',
                                          ),
                                        );
                                      });
                                } else {
                                  questionIndex++;

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          IntroductionScreen(),
                                    ),
                                  );
                                }
                              },
                              storyItems:
                                  storyItems, // To disable vertical swipe gestures, ignore this parameter.
                              // Preferrably for inline story view.
                            ),
                          ),
                        ),
                      )
                    : FadeOut(child: SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
