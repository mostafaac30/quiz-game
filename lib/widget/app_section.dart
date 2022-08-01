import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/preferneces/preferneces.dart';

class AppSection extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  final double? verticalPadding;

  const AppSection({
    Key? key,
    required this.title,
    required this.onTap,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.185,
          height: MediaQuery.of(context).size.height * 0.005,
          color: Colors.amber,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.63,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                //circle border
                decoration: kInnerDecoration,
                padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
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
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.185,
          height: MediaQuery.of(context).size.height * 0.005,
          color: Colors.amber,
        )
      ],
    );
  }
}
