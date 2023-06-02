import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20),
      child: InkWell(
        onTap: widget.home,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 10.0),
                const AppText(
                    text: 'Pranav Dave', color: Colors.black, fontSize: 20.0)
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: widget.about,
                  child: Text('About me'),
                ),
                const SizedBox(width: 50.0),
                InkWell(
                  onTap: widget.skill,
                  child: Text('Skills'),
                ),
                const SizedBox(width: 50.0),
                InkWell(
                  onTap: widget.projects,
                  child: Text('Projects'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
