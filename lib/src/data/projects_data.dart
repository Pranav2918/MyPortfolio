import 'package:flutter/material.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

import '../presentation/views/project/projects.dart';

final List<Widget> mdCardsList = [
  MDScreenProjectCards(
    appLogo: Images.coupinos,
    name: "Coupino",
    description:
        "Support the business in your direct neighbourhood and benefit from attractive vouchers and offers",
    onTap: () {},
  ),
  MDScreenProjectCards(
    appLogo: Images.piatto,
    name: "Piatto Chat",
    description:
        "An application for chat that lets users browse their friends on a map, talk, submit feeds, and interact with feeds over a place.",
    onTap: () {},
  ),
  MDScreenProjectCards(
    appLogo: Images.flutterLogo,
    name: "Animbutton",
    description:
        " Elegant UI interactions with smooth animations, customizable styles, and seamless integration across the platforms.",
    onTap: () async {
      try {
        await launchURL(Strings.animButtonLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
];

final List<Widget> lgCardsList = [
  LGScreenProjectCards(projectImage: Images.coupinos, onTap: () {}),
  LGScreenProjectCards(projectImage: Images.piatto, onTap: () {}),
  LGScreenProjectCards(
      projectImage: Images.flutterLogo,
      onTap: () async {
        try {
          await launchURL(Strings.animButtonLink);
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
];
