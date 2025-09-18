import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Center(
            child: Column(
              children: [
                SelectableText(
                  'ABOUT',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 35.0, letterSpacing: 2.0),
                ),
                const SizedBox(height: 25.0),
                !ResponsiveScreenProvider.isDesktopScreen(context)
                    ? SelectableText(
                        'Look at my passions, accomplishments\nand hobbies.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey),
                      )
                    : SelectableText(
                        'Look at my passions, accomplishments, and hobbies.',
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
                              : 15.0,),
                  child: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? Column(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: 'Introduction',
                              context: context,
                              description: SelectableText(
                                Strings.aboutIntroText,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        letterSpacing: 1.0, fontSize: 16.0,),
                              ),
                            ),
                            _aboutCards(
                                context: context,
                                description: _skillDescriptionWidget(context),
                                title: 'Skills and Expertise',
                                screenSize: screenSize,),
                          ],
                        )
                      : Row(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: 'Introduction',
                              context: context,
                              description: SelectableText(
                                Strings.aboutIntroText,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        letterSpacing: 1.0, fontSize: 16.0,),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            _aboutCards(
                                context: context,
                                description: _skillDescriptionWidget(context),
                                title: 'Skills and Expertise',
                                screenSize: screenSize,),
                          ],
                        ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical:
                          !ResponsiveScreenProvider.isDesktopScreen(context)
                              ? 0.0
                              : 15.0,),
                  child: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? Column(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: 'Interests',
                              context: context,
                              description: _interestDescription(context),
                            ),
                            _aboutCards(
                                context: context,
                                description: _educationDescription(context),
                                title: 'Education',
                                screenSize: screenSize,),
                          ],
                        )
                      : Row(
                          children: [
                            _aboutCards(
                              screenSize: screenSize,
                              title: 'Interests',
                              context: context,
                              description: _interestDescription(context),
                            ),
                            const Expanded(child: SizedBox()),
                            _aboutCards(
                                context: context,
                                description: _educationDescription(context),
                                title: 'Education',
                                screenSize: screenSize,),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //About section's card widget
  Widget _aboutCards(
      {required String title, required Widget description, required BuildContext context, var screenSize,}) => Card(
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
                          letterSpacing: 2.0,),
                    ),
                    const SizedBox(height: 25.0),
                    description, //Widget contains various description layout
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
                            letterSpacing: 2.0,),
                      ),
                      const SizedBox(height: 25.0),
                      description, //Widget contains various description layout
                    ],
                  ),
                ),
        ),
      ),
    );

  //Skills
  Widget _skillDescriptionWidget(BuildContext context) => Column(
      children: [
        !ResponsiveScreenProvider.isDesktopScreen(context)
            ? Column(
                children: [
                  _skillPoints('Flutter Framework', context),
                  _skillPoints('Dart Programming', context),
                  _skillPoints('REST API Integration', context),
                  _skillPoints('State Management', context),
                  _skillPoints('Firebase ', context),
                  _skillPoints('Unit Testing', context),
                  _skillPoints('Firebase', context),
                  _skillPoints('Teamwork', context),
                ],
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _skillPoints('Flutter Framework', context),
                      _skillPoints('Dart Programming', context),
                      _skillPoints('REST API Integration', context),
                      _skillPoints('State Management', context),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _skillPoints('Firebase ', context),
                      _skillPoints('Unit Testing', context),
                      _skillPoints('Firebase', context),
                      _skillPoints('Teamwork', context),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
      ],
    );

  Widget _skillPoints(String skill, BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Images.bullet,
            colorFilter:
                const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
          ),
          const SizedBox(width: 25.0),
          Text(skill, style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );

  //Interests
  Widget _interestDescription(BuildContext context) => Column(
      children: [
        !ResponsiveScreenProvider.isDesktopScreen(context)
            ? Column(
                children: [
                  _interestPoints(
                      'Photography', Images.camera, context,),
                  _interestPoints(
                      'Web Series', Images.webSeries, context,),
                  _interestPoints('Music', Images.music, context),
                  _interestPoints(
                      'Travel', Images.travel, context,),
                  _interestPoints(
                      'Cricket', Images.cricket, context,),
                  _interestPoints(
                      'Hiking', Images.hiking, context,),
                  _interestPoints(
                      'Stock Analysis', Images.stock, context,),
                ],
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _interestPoints(
                          'Photography', Images.camera, context,),
                      _interestPoints(
                          'Web Series', Images.webSeries, context,),
                      _interestPoints(
                          'Music', Images.music, context,),
                      _interestPoints(
                          'Travel', Images.travel, context,),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _interestPoints(
                          'Cricket', Images.cricket, context,),
                      _interestPoints(
                          'Hiking', Images.hiking, context,),
                      _interestPoints(
                          'Stock Analysis', Images.stock, context,),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
      ],
    );

  Widget _interestPoints(
      String interest, String imageAsset, BuildContext context,) => Padding(
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

  Widget _educationDescription(BuildContext context) => Column(
      children: [
        _educations(context, '09/2019 - 01/2022', 'B.E. in Computer Science'),
        const SizedBox(height: 35.0),
        _educations(context, '08/2016 - 10/2019', 'Diploma in Computer Science'),
      ],
    );
}

Widget _educations(BuildContext context, String year, String course) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        Images.bullet,
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
                    .copyWith(fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10.0,
            ),
            Text('Dr. Subhash University',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent),),
            const SizedBox(
              height: 10.0,
            ),
            Text(year,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),),
          ],
        ),
      ),
    ],
  );
