import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:test/model/qeustion.dart';
import 'package:test/preferneces/preferneces.dart';
import 'package:test/screens/gameplay.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    List<StoryItem> storyItems = [
      StoryItem.text(
        title: questions[questionIndex].intro,
        backgroundColor: mainColor,
        textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        duration: Duration(seconds: 5),
      ),
    ]; // your list of stories

    return Scaffold(
      body: StoryView(
        controller: controller, // pass controller here too
        repeat: false, // should the stories be slid forever
        // onStoryShow: (s) {notifyServer(s);},
        onComplete: () {
          print('Completed');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GamePlay(),
            ),
          );
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
        storyItems:
            storyItems, // To disable vertical swipe gestures, ignore this parameter.
        // Preferrably for inline story view.
      ),
    );
  }
}
