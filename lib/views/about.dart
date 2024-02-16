import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pranavdave/common/const.dart';
import 'package:pranavdave/common/responsive.dart';

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
                !ResponsiveScreenProvider.isDesktopScreen(context)
                    ? SelectableText(
                        "Look at my passions, accomplishments\nand hobbies.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey),
                      )
                    : SelectableText(
                        "Look at my passions, accomplishments, and hobbies.",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey, letterSpacing: 1.0),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical:
                          !ResponsiveScreenProvider.isDesktopScreen(context)
                              ? 0.0
                              : 15.0),
                  child: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? Column(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: "Introduction",
                              context: context,
                              description: SelectableText(
                                Constants.aboutIntroText,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        letterSpacing: 1.0, fontSize: 16.0),
                              ),
                            ),
                            _aboutCards(
                                context: context,
                                description: _skillDescriptionWidget(context),
                                title: "Skills and Expertise",
                                screenSize: screenSize),
                          ],
                        )
                      : Row(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: "Introduction",
                              context: context,
                              description: SelectableText(
                                Constants.aboutIntroText,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        letterSpacing: 1.0, fontSize: 16.0),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical:
                          !ResponsiveScreenProvider.isDesktopScreen(context)
                              ? 0.0
                              : 15.0),
                  child: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? Column(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: "Interests",
                              context: context,
                              description: _interestDescription(context),
                            ),
                            _aboutCards(
                                context: context,
                                description: _educationDescription(context),
                                title: "Education",
                                screenSize: screenSize),
                          ],
                        )
                      : Row(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: "Interests",
                              context: context,
                              description: _interestDescription(context),
                            ),
                            const Expanded(child: SizedBox()),
                            _aboutCards(
                                context: context,
                                description: _educationDescription(context),
                                title: "Education",
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

  //About section's card widget
  Widget _aboutCards(
      {var screenSize,
      required String title,
      required Widget description,
      required BuildContext context}) {
    return Card(
      child: SizedBox(
        height: !ResponsiveScreenProvider.isDesktopScreen(context)
            ? null
            : screenSize.height / 2.0,
        width: screenSize.width > 965
            ? screenSize.width / 2.1
            : !ResponsiveScreenProvider.isDesktopScreen(context)
                ? screenSize.width
                : screenSize.width / 2.2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: !ResponsiveScreenProvider.isDesktopScreen(context)
              ? Column(
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
                )
              : SingleChildScrollView(
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

  //Skills
  Widget _skillDescriptionWidget(BuildContext context) {
    return Column(
      children: [
        !ResponsiveScreenProvider.isDesktopScreen(context)
            ? Column(
                children: [
                  _skillPoints("Flutter Framework", context),
                  _skillPoints("Dart Programming", context),
                  _skillPoints("REST API Integration", context),
                  _skillPoints("State Management", context),
                  _skillPoints("Firebase ", context),
                  _skillPoints("Unit Testing", context),
                  _skillPoints("Firebase", context),
                  _skillPoints("Teamwork", context),
                ],
              )
            : Row(
                children: [
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
          const SizedBox(width: 25.0),
          Text(skill, style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }

  //Interests
  Widget _interestDescription(BuildContext context) {
    return Column(
      children: [
        !ResponsiveScreenProvider.isDesktopScreen(context)
            ? Column(
                children: [
                  _interestPoints(
                      "Photography", "assets/images/camera.svg", context),
                  _interestPoints(
                      "Web Series", "assets/images/webseries.svg", context),
                  _interestPoints("Music", "assets/images/music.svg", context),
                  _interestPoints(
                      "Travel", "assets/images/travell.svg", context),
                  _interestPoints(
                      "Cricket", "assets/images/cricket.svg", context),
                  _interestPoints(
                      "Hiking", "assets/images/hiking.svg", context),
                  _interestPoints(
                      "Stock Analysis", "assets/images/stock.svg", context),
                ],
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _interestPoints(
                          "Photography", "assets/images/camera.svg", context),
                      _interestPoints(
                          "Web Series", "assets/images/webseries.svg", context),
                      _interestPoints(
                          "Music", "assets/images/music.svg", context),
                      _interestPoints(
                          "Travel", "assets/images/travell.svg", context),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _interestPoints(
                          "Cricket", "assets/images/cricket.svg", context),
                      _interestPoints(
                          "Hiking", "assets/images/hiking.svg", context),
                      _interestPoints(
                          "Stock Analysis", "assets/images/stock.svg", context),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
      ],
    );
  }

  Widget _interestPoints(
      String interest, String imageAsset, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              imageAsset,
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 25.0),
          Text(
            interest,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }

  Widget _educationDescription(BuildContext context) {
    return Column(
      children: [
        _educations(context, "09/2019 - 01/2022", "B.E. in Computer Science"),
        const SizedBox(height: 35.0),
        _educations(context, "08/2016 - 10/2019", "Diploma in Computer Science")
      ],
    );
  }
}

Widget _educations(BuildContext context, String year, String course) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        "assets/images/bullet.svg",
        colorFilter: const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10.0,
            ),
            Text("Dr. Subhash University",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent)),
            const SizedBox(
              height: 10.0,
            ),
            Text(year,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey)),
          ],
        ),
      ),
    ],
  );
}
