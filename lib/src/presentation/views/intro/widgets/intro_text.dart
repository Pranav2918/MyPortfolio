import 'package:flutter/material.dart';
import 'package:pranavdave/src/utils/const/strings.dart';
import 'package:pranavdave/src/utils/sizer.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: [
        SelectableText(
          Strings.introText,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: Colors.grey,
            fontSize: 26,
          ),
        ),
        SizedBox(height: Sizer.screenHeight * 0.02),
        SelectableText(
          Strings.name.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            letterSpacing: 1.0,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
}