import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animator/widgets/flippers/flip.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String? iconImage;
  const TextWithIcon({Key? key, required this.text, this.icon, this.iconImage})
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
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
        icon != null
            ? Icon(
                icon,
                color: Colors.white,
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
