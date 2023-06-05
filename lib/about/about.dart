import 'package:flutter/material.dart';
import 'package:pranavdave/projects/const.dart';
import 'package:pranavdave/utils/strings.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';
import '../utils/urlLauncher.dart';
import '../widgets/appText.dart';

class About extends StatefulWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 450 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 100 : 20),
      child: Responsive.isDesktop(context)
          ? _renderLargeScreenAboutSection()
          : _renderSmallScreenAboutSection(),
    );
  }

  Widget _renderLargeScreenAboutSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/aboutme.png',
              height: 300,
              width: 300,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "About Me",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              const SizedBox(height: 10.0),
              const AppText(
                text: Strings.about,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        UrlLauncher.launchURL(
                            "https://drive.google.com/file/d/1UdeFgbYuApoWuLF7jPnfIWckfZkV6lN7/view?usp=drivesdk");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: const AppText(
                          text: 'Resume', color: Colors.white, fontSize: 15)),
                  const SizedBox(width: 15.0),
                  ElevatedButton(
                      onPressed: () {
                        UrlLauncher.launchURL(AppConst.stackoverflow);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: const AppText(
                          text: 'Stack overflow',
                          color: Colors.white,
                          fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderSmallScreenAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            'assets/images/aboutme.png',
            height: 200,
            width: 200,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: "About Me",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
            const SizedBox(height: 10.0),
            const AppText(
              text: Strings.about,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      UrlLauncher.launchURL(
                          "https://drive.google.com/file/d/1UdeFgbYuApoWuLF7jPnfIWckfZkV6lN7/view?usp=drivesdk");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const AppText(
                        text: 'Resume', color: Colors.white, fontSize: 15)),
                const SizedBox(width: 15.0),
                ElevatedButton(
                    onPressed: () {
                      UrlLauncher.launchURL(AppConst.stackoverflow);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const AppText(
                        text: 'Stack overflow',
                        color: Colors.white,
                        fontSize: 15)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
