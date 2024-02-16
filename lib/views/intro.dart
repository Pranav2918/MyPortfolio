import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranavdave/common/responsive.dart';
import 'package:pranavdave/widgets/animated_text.dart';
import 'package:pranavdave/widgets/text_w_image.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return !ResponsiveScreenProvider.isDesktopScreen(context)
        ? _introPageForMDScreens(screenSize, context)
        : _introPageForLGScreen(screenSize, context);
  }

  //Intro section for large screens (Desktop, Landscape Tablets)
  Widget _introPageForLGScreen(var screenSize, BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                _showIntroText(screenSize, context),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWithImage(
                            text: "Computer Engineer",
                            image: "assets/images/engineer.svg"),
                        SizedBox(height: screenSize.height * 0.02),
                        const TextWithImage(
                            text: "Flutter Developer",
                            image: "assets/images/flutter.svg"),
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWithImage(
                            text: "Traveller",
                            image: "assets/images/travell.svg"),
                        SizedBox(height: screenSize.height * 0.02),
                        const TextWithImage(
                            text: "Community Contributor",
                            image: "assets/images/community.svg"),
                      ],
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                //Changing Texts
                const ChangingText(),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.08),
            child: Image.asset(
              "assets/images/profile.png",
              height: 300.0,
              width: 300.0,
            ),
          )
        ]);
  }

  //Intro section for small/medium screens (Mobiles, Tablets)
  Widget _introPageForMDScreens(var screenSize, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: screenSize.height * 0.05),
          Center(
            child: Image.asset(
              "assets/images/profile.png",
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          _showIntroText(screenSize, context),
          //Changing Texts
          const ChangingText(),
          SizedBox(height: screenSize.height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWithImage(
                      text: "Computer Engineer",
                      image: "assets/images/engineer.svg"),
                  SizedBox(height: screenSize.height * 0.03),
                  const TextWithImage(
                      text: "Flutter Developer",
                      image: "assets/images/flutter.svg"),
                  SizedBox(height: screenSize.height * 0.03),
                  const TextWithImage(
                      text: "Traveller", image: "assets/images/travell.svg"),
                  SizedBox(height: screenSize.height * 0.03),
                  const TextWithImage(
                      text: "Community Contributor",
                      image: "assets/images/community.svg"),
                ],
              ),
            ],
          ),
          SizedBox(height: screenSize.height * 0.08),
        ],
      ),
    );
  }

  //Intro Text
  Widget _showIntroText(var screenSize, BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello There..... I'm",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.grey, fontSize: 26),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          "PRANAV DAVE",
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
