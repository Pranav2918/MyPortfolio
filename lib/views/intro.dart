import 'package:flutter/material.dart';
import 'package:pranavdave/common/responsive.dart';
import 'package:pranavdave/src/utils/const/const.dart';
import 'package:pranavdave/widgets/animated_text.dart';
import 'package:pranavdave/widgets/text_w_image.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Image.asset(
                "assets/images/profile.png",
                height: 300.0,
                width: 300.0,
              ),
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
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Image.asset(
                "assets/images/profile.png",
                height: 200.0,
                width: 200.0,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          _showIntroText(screenSize, context),
          //Changing Texts
          // const ChangingText(),
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
        SelectableText(
          Constants.introText,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.grey, fontSize: 26),
        ),
        SizedBox(height: screenSize.height * 0.02),
        SelectableText(
          Constants.name.toUpperCase(),
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
