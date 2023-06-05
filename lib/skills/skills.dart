import 'package:flutter/material.dart';
import 'package:pranavdave/skills/skillModel.dart';
import 'package:pranavdave/utils/colors.dart';

import '../utils/responsive.dart';
import '../widgets/appText.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20,
          vertical: Responsive.isDesktop(context) ? 50 : 20),
      child: Column(
        children: [
          const AppText(
            text: 'Skills',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
          const SizedBox(height: 30.0),
          Responsive.isDesktop(context)
              ? SizedBox(
                  width: Responsive.isMobile(context) ? 300 : 600,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 50,
                    ),
                    itemCount: skills.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int i) {
                      return _skillCard(context, i);
                    },
                  ),
                )
              : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 50,
                  ),
                  itemCount: skills.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return _skillCard(context, i);
                  },
                ),
              )
        ],
      ),
    );
  }

  Widget _skillCard(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPurple.withOpacity(0.2),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ],
          border: Border.all(color: AppColors.primaryPurple),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            skills[index].icons!,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: skills[index].title!,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
