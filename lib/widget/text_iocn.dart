import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        // text
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
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
            : Image.asset(
                iconImage ?? '',
                height: 25,
                width: 25,
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
      ],
    );
  }
}
