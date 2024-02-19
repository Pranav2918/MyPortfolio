import 'package:pranavdave/common/imports.dart';

class ChangingText extends StatelessWidget {
  const ChangingText({super.key});
  final Duration textChangingDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              animatedTexts: [
                TypewriterAnimatedText('Developer',
                    speed: textChangingDuration),
                TypewriterAnimatedText('Innovator',
                    speed: textChangingDuration),
                TypewriterAnimatedText('Visionary',
                    speed: textChangingDuration),
                TypewriterAnimatedText('Self Learner',
                    speed: textChangingDuration),
                TypewriterAnimatedText('Contributor',
                    speed: textChangingDuration),
              ],
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
