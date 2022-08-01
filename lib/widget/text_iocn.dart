import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animator/widgets/flippers/flip.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  bool isIcon;
  final String? iconImage;
  TextWithIcon(
      {Key? key,
      required this.text,
      this.isIcon = true,
      required this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
        // text with animation

        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              child: child,
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            );
          },
          child: Text(
            text,
            key: ValueKey<String>(text),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: "",
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
        isIcon
            ? Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Image.asset(
                  iconImage ?? '',
                  height: 30,
                  width: 30,
                  key: ValueKey<String>(text),
                ),
              )
            : AnimatedSwitcher(
                duration: Duration(milliseconds: 2500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return Flip(
                    child: child,
                  );
                },
                child: Image.asset(
                  iconImage ?? '',
                  height: 25,
                  width: 25,
                  key: ValueKey<String>(text),
                ),
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
      ],
    );
  }
}
