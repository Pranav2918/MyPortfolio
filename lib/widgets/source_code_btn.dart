import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pranavdave/common/url_launcher_function.dart';

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
            await launchURL('https://github.com/Pranav2918/MyPortfolio');
          } catch (e) {
            debugPrint('Error launching URL: $e');
          }
        },
        child: SvgPicture.asset(
          "assets/images/github.svg",
          height: height,
          width: width,
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
        ),
      ),
    );
  }
}
