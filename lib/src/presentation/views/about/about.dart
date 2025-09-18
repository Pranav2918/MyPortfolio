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
    final isDesktop = ResponsiveScreenProvider.isDesktopScreen(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.05),
          Center(
            child: Column(
              children: [
                SelectableText(
                  'ABOUT',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 35.0,
                        letterSpacing: 2.0,
                      ),
                ),
                const SizedBox(height: 25.0),
                SelectableText(
                  isDesktop
                      ? 'Look at my passions, accomplishments, and hobbies.'
                      : 'Look at my passions, accomplishments\nand hobbies.',
                  textAlign: isDesktop ? TextAlign.start : TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey, letterSpacing: 1.0),
                ),
                _responsiveSection(
                  isDesktop: isDesktop,
                  screenSize: screenSize,
                  left: _aboutCards(
                    screenSize: screenSize,
                    title: 'Introduction',
                    context: context,
                    description: SelectableText(
                      Strings.aboutIntroText,
                      textAlign: TextAlign.justify,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                letterSpacing: 1.0,
                                fontSize: 16.0,
                              ),
                    ),
                  ),
                  right: _aboutCards(
                    context: context,
                    description: _skillDescriptionWidget(context, isDesktop),
                    title: 'Skills and Expertise',
                    screenSize: screenSize,
                  ),
                ),
                _responsiveSection(
                  isDesktop: isDesktop,
                  screenSize: screenSize,
                  left: _aboutCards(
                    screenSize: screenSize,
                    title: 'Interests',
                    context: context,
                    description: _interestDescription(context, isDesktop),
                  ),
                  right: _aboutCards(
                    context: context,
                    description: _educationDescription(context),
                    title: 'Education',
                    screenSize: screenSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _responsiveSection({
    required bool isDesktop,
    required Size screenSize,
    required Widget left,
    required Widget right,
  }) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: isDesktop ? 15.0 : 0.0,
      ),
      child: isDesktop
          ? Row(children: [left, const Expanded(child: SizedBox()), right])
          : Column(children: [left, right]),
    );

  // About section's card widget
  Widget _aboutCards({
    required String title,
    required Widget description,
    required BuildContext context,
    required Size screenSize,
  }) {
    final isDesktop = ResponsiveScreenProvider.isDesktopScreen(context);

    return Card(
      child: SizedBox(
        height: isDesktop ? screenSize.height / 2.0 : null,
        width: screenSize.width > 965
            ? screenSize.width / 2.1
            : isDesktop
                ? screenSize.width / 2.2
                : screenSize.width,
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
                        letterSpacing: 2.0,
                      ),
                ),
                const SizedBox(height: 25.0),
                description,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Skills
  Widget _skillDescriptionWidget(BuildContext context, bool isDesktop) {
    final skills = [
      'Flutter Framework',
      'Dart Programming',
      'REST API Integration',
      'State Management',
      'Firebase',
      'Unit Testing',
      'Teamwork',
    ];

    return isDesktop
        ? Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills
                      .take(4)
                      .map((s) => _skillPoints(s, context))
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills
                      .skip(4)
                      .map((s) => _skillPoints(s, context))
                      .toList(),
                ),
              ),
            ],
          )
        : Column(
            children: skills.map((s) => _skillPoints(s, context)).toList(),
          );
  }

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

  // Interests
  Widget _interestDescription(BuildContext context, bool isDesktop) {
    final interests = [
      {'title': 'Photography', 'icon': Images.camera},
      {'title': 'Web Series', 'icon': Images.webSeries},
      {'title': 'Music', 'icon': Images.music},
      {'title': 'Travel', 'icon': Images.travel},
      {'title': 'Cricket', 'icon': Images.cricket},
      {'title': 'Hiking', 'icon': Images.hiking},
      {'title': 'Stock Analysis', 'icon': Images.stock},
    ];

    return isDesktop
        ? Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: interests
                      .take(4)
                      .map(
                        (e) => _interestPoints(
                          e['title']!,
                          e['icon']!,
                          context,
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: interests
                      .skip(4)
                      .map(
                        (e) => _interestPoints(
                          e['title']!,
                          e['icon']!,
                          context,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          )
        : Column(
            children: interests
                .map(
                  (e) => _interestPoints(
                    e['title']!,
                    e['icon']!,
                    context,
                  ),
                )
                .toList(),
          );
  }

  Widget _interestPoints(
    String interest,
    String imageAsset,
    BuildContext context,
  ) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: SvgPicture.asset(
              imageAsset,
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 25.0),
          Text(interest, style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );

  // Education
  Widget _educationDescription(BuildContext context) => const Column(
      children: [
        _EducationItem(
          year: '09/2019 - 01/2022',
          course: 'B.E. in Computer Science',
        ),
        SizedBox(height: 35.0),
        _EducationItem(
          year: '08/2016 - 10/2019',
          course: 'Diploma in Computer Science',
        ),
      ],
    );
}

class _EducationItem extends StatelessWidget {
  final String year;
  final String course;

  const _EducationItem({required this.year, required this.course});

  @override
  Widget build(BuildContext context) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Images.bullet,
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Dr. Subhash University',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent),
              ),
              const SizedBox(height: 10.0),
              Text(
                year,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
}
