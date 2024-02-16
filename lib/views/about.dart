import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pranavdave/common/const.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectableText(
                  "ABOUT",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 35.0, letterSpacing: 2.0),
                ),
                const SizedBox(height: 25.0),
                SelectableText(
                  "Look at my passions, accomplishments, and hobbies.",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey, letterSpacing: 1.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    children: [
                      _aboutCards(
                        screenSize: screenSize,
                        title: "Introduction",
                        context: context,
                        description: SelectableText(
                          Constants.aboutIntroText,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(letterSpacing: 1.0, fontSize: 16),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      _aboutCards(
                          context: context,
                          description: _skillDescriptionWidget(context),
                          title: "Skills and Expertise",
                          screenSize: screenSize),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    children: [
                      _aboutCards(
                        screenSize: screenSize,
                        title: "Interests",
                        context: context,
                        description: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/camera.svg",
                              height: 40.0,
                              width: 40.0,
                            ),
                            const Text("Photography")
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      _aboutCards(
                          context: context,
                          description: _skillDescriptionWidget(context),
                          title: "Skills and Expertise",
                          screenSize: screenSize),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _aboutCards(
      {var screenSize,
      required String title,
      required Widget description,
      required BuildContext context}) {
    return Card(
      child: SizedBox(
        height: screenSize.height / 2.0,
        width: screenSize.width > 965
            ? screenSize.width / 2.1
            : screenSize.width / 2.2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0),
                ),
                const SizedBox(height: 25.0),
                description //Widget contains various description layout
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _skillDescriptionWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _skillPoints("Flutter Framework", context),
                _skillPoints("Dart Programming", context),
                _skillPoints("REST API Integration", context),
                _skillPoints("State Management", context),
              ],
            ),
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _skillPoints("Firebase ", context),
                _skillPoints("Unit Testing", context),
                _skillPoints("Firebase", context),
                _skillPoints("Teamwork", context),
              ],
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _skillPoints(String skill, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/images/bullet.svg",
            colorFilter:
                const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
          ),
          Text(skill, style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }

  Widget _interestDescription() {
    return Column(
      children: [_interestPoints("Photography", "assets/images/camera.svg")],
    );
  }

  Widget _interestPoints(String interest, String imageAsset) {
    return Row(
      children: [SvgPicture.asset(imageAsset), Text(interest)],
    );
  }
}
