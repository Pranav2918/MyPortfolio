import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class SourceCodeButton extends StatelessWidget {
  final double height;
  final double width;
  const SourceCodeButton(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10.0)),
      message: "Source Code",
      textStyle: Theme.of(context).textTheme.displaySmall,
      child: GestureDetector(
        onTap: () async {
          try {
            await launchURL(Strings.portfolioLink);
          } catch (e) {
            debugPrint('Error launching URL: $e');
          }
        },
        child: SvgPicture.asset(
          Images.github,
          height: height,
          width: width,
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
        ),
      ),
    );
  }
}
