import 'package:flutter/material.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class ConnectModel {
  ConnectModel({
    required this.connectString,
    required this.connectSymbol,
    required this.connectType,
    required this.onTap,
  });

  final String connectString;
  final String connectSymbol;
  final String connectType;
  final VoidCallback onTap;
}

List<ConnectModel> connections = <ConnectModel>[
  ConnectModel(
    connectString: 'pranav.18.dave@gmail.com',
    connectSymbol: Images.mail,
    connectType: 'Mail',
    onTap: () async {
      try {
        await launchURL('mailto:pranav.18.dave@gmail.com');
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
  ConnectModel(
    connectString: '+91-7016156637',
    connectSymbol: Images.phone,
    connectType: 'Phone',
    onTap: () {},
  ),
  ConnectModel(
    connectString: 'in/pranav-dave',
    connectSymbol: Images.linkedIn,
    connectType: 'LinkedIn',
    onTap: () async {
      try {
        await launchURL(Strings.linkedInLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
  ConnectModel(
    connectString: 'Pranav2918',
    connectSymbol: Images.github,
    connectType: 'Github',
    onTap: () async {
      try {
        await launchURL(Strings.githubLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
  ConnectModel(
    connectString: 'pranav-dave',
    connectSymbol: Images.stack,
    connectType: 'Stack Overflow',
    onTap: () async {
      try {
        await launchURL(Strings.stackOverflowLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
  ConnectModel(
    connectString: 'pranavdave__',
    connectSymbol: Images.insta,
    connectType: 'Instagram',
    onTap: () async {
      try {
        await launchURL(Strings.instagramLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
];
