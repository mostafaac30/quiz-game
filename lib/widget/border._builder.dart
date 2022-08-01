import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/preferneces/preferneces.dart';

class BorderBuilder extends StatelessWidget {
  final Widget child;
  final double? verticalPadding;
  const BorderBuilder({Key? key, required this.child, this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
          //circle border
          decoration: kInnerDecoration,
          child: child,
        ),
      ),
      decoration: kGradientBoxDecoration,
    );
  }
}
