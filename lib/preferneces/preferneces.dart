import 'package:flutter/material.dart';

Color mainColor = Color.fromRGBO(3, 54, 108, 1);
Color goldColor = Color.fromRGBO(238, 220, 153, 1);
final kInnerDecoration = BoxDecoration(
  color: mainColor,
  borderRadius: BorderRadius.circular(32),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [goldColor, Color.fromRGBO(238, 220, 160, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  ),
  borderRadius: BorderRadius.circular(32),
);

int coinsCount = 30000;

bool isSoundOn = true;

int questionIndex = 0;
