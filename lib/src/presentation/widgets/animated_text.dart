import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});
  final Duration textChangingDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableText(
          "I'm",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 30, letterSpacing: 2.0),
        ),
        const SizedBox(width: 10.0),
        SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 30, letterSpacing: 2.0, color: Colors.blueAccent),
            child: AnimatedTextKit(
              animatedTexts: List.generate(
                  Strings.keywords.length,
                  (keyIndex) => TypewriterAnimatedText(
                      cursor: "..",
                      speed: Duration(milliseconds: 100),
                      Strings.keywords[keyIndex])),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
