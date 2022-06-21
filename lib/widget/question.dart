import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/pref/preferneces.dart';

class QuestionBuilder extends StatelessWidget {
  final String title;

  const QuestionBuilder({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              //circle border
              decoration: kInnerDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text
                  Expanded(
                    child: Center(
                      child: Text(
                        // title
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: kGradientBoxDecoration,
        ),
      ],
    );
  }
}
