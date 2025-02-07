import 'package:flutter/material.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SelectableText(
          Strings.introText,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.grey, fontSize: 26),
        ),
        SizedBox(height: screenSize.height * 0.02),
        SelectableText(
          Strings.name.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              letterSpacing: 1.0,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        ),
      ],
    );
  }
}