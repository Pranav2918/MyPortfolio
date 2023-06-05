import 'package:flutter/material.dart';
import 'package:pranavdave/projects/const.dart';
import 'package:pranavdave/utils/colors.dart';
import 'package:pranavdave/utils/urlLauncher.dart';

import '../utils/responsive.dart';
import '../widgets/appText.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 450 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 90 : 10),
      color: Colors.white,
      child: Responsive.isDesktop(context)
          ? _rendenBigScreenContent()
          : _renderSmallScreenContent(),
    );
  }

  //Content to show on desktop or laptop
  Widget _rendenBigScreenContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "Hey There! I'm",
                color: Colors.black,
                fontSize: 14,
              ),
              const SizedBox(height: 5.0),
              const AppText(
                text: 'Pranav Dave',
                color: AppColors.primaryPurple,
                fontSize: 30,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              const SizedBox(height: 5.0),
              const AppText(
                text: 'Flutter Application Developer',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    UrlLauncher.launchURL(AppConst.linkedinUrl);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      minimumSize: const Size(100, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: const AppText(
                      text: 'LinkedIn', color: Colors.white, fontSize: 15))
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage("assets/images/intro.png"))),
          ),
        )
      ],
    );
  }

  //Content to show on mobile Devices
  Widget _renderSmallScreenContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0),
        const AppText(
          text: "Hey There! I'm",
          color: Colors.black,
          fontSize: 14,
        ),
        const SizedBox(height: 5.0),
        const AppText(
          text: 'Pranav Dave',
          color: AppColors.primaryPurple,
          fontSize: 30,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
        const SizedBox(height: 5.0),
        const AppText(
          text: 'Flutter Application Developer',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: () {
              UrlLauncher.launchURL(AppConst.linkedinUrl);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                minimumSize: const Size(100, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            child: const AppText(
                text: 'LinkedIn', color: Colors.white, fontSize: 15)),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
