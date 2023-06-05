import 'package:flutter/material.dart';
import 'package:pranavdave/utils/colors.dart';
import 'package:pranavdave/widgets/appText.dart';

import '../utils/responsive.dart';

class HeaderSection extends StatefulWidget {
  final Function()? home;
  final Function()? about;
  final Function()? skill;
  final Function()? projects;
  const HeaderSection(
      {super.key, this.home, this.about, this.skill, this.projects});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool isAboutHovered = false;
  bool isSkillsHovered = false;
  bool isProjectsHovered = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: 70,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 100 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.home,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 10.0),
                const AppText(
                    letterSpacing: 1.0,
                    text: 'Pranav Dave',
                    color: AppColors.primaryPurple,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400)
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onHover: (value) {
                  setState(() {
                    isAboutHovered = value;
                  });
                },
                onTap: widget.about,
                child: AppText(
                  text: 'About me',
                  color:
                      isAboutHovered ? AppColors.primaryPurple : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(width: 50.0),
              InkWell(
                onHover: (value) {
                  setState(() {
                    isSkillsHovered = value;
                  });
                },
                onTap: widget.skill,
                child: AppText(
                  text: 'Skills',
                  color:
                      isSkillsHovered ? AppColors.primaryPurple : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(width: 50.0),
              InkWell(
                onHover: (value) {
                  setState(() {
                    isProjectsHovered = value;
                  });
                },
                onTap: widget.projects,
                child: AppText(
                  text: 'Projects',
                  color: isProjectsHovered
                      ? AppColors.primaryPurple
                      : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
