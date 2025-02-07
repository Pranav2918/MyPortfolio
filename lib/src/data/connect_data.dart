import 'package:flutter/material.dart';
import 'package:pranavdave/src/presentation/views/connect/connect_card.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

final List<Widget> connectionOptionsMD = <Widget>[
  ConnectCardWidget(
      connectString: "pranav.18.dave@gmail.com",
      connectSymbol: Images.mail,
      connectType: "Mail",
      onTap: () async {
        try {
          await launchURL('mailto:pranav.18.dave@gmail.com');
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
  const SizedBox(
    height: 10.0,
  ),
  ConnectCardWidget(
      connectString: "+91-7016156637",
      connectSymbol: Images.phone,
      connectType: "Phone",
      onTap: () {}),
  const SizedBox(
    height: 10.0,
  ),
  ConnectCardWidget(
      connectString: "in/pranav-dave",
      connectSymbol: Images.linkedIn,
      connectType: "LinkedIn",
      onTap: () async {
        try {
          await launchURL(Strings.linkedInLink);
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
  ConnectCardWidget(
      connectString: "Pranav2918",
      connectSymbol: Images.github,
      connectType: "Github",
      onTap: () async {
        try {
          await launchURL(Strings.githubLink);
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
  const SizedBox(
    height: 10.0,
  ),
  ConnectCardWidget(
      connectString: "pranav-dave",
      connectSymbol: Images.stack,
      connectType: "Stack Overflow",
      onTap: () async {
        try {
          await launchURL(Strings.stackOverflowLink);
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
  const SizedBox(
    height: 10.0,
  ),
  ConnectCardWidget(
      connectString: "pranavdave__",
      connectSymbol: Images.insta,
      connectType: "Instagram",
      onTap: () async {
        try {
          await launchURL(Strings.instagramLink);
        } catch (e) {
          debugPrint('Error launching URL: $e');
        }
      }),
];

final List<Widget> connectCardLG = [
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ConnectCardWidget(
          connectString: "pranav.18.dave@gmail.com",
          connectSymbol: Images.mail,
          connectType: "Mail",
          onTap: () async {
            try {
              await launchURL(Strings.doMail);
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
      const SizedBox(
        width: 10.0,
      ),
      ConnectCardWidget(
          connectString: "+91-7016156637",
          connectSymbol: Images.phone,
          connectType: "Phone",
          onTap: () {}),
      const SizedBox(
        width: 10.0,
      ),
      ConnectCardWidget(
          connectString: "in/pranav-dave",
          connectSymbol: Images.linkedIn,
          connectType: "LinkedIn",
          onTap: () async {
            try {
              await launchURL(Strings.linkedInLink);
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
    ],
  ),
  const SizedBox(
    height: 25.0,
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ConnectCardWidget(
          connectString: "Pranav2918",
          connectSymbol: Images.github,
          connectType: "Github",
          onTap: () async {
            try {
              await launchURL(Strings.githubLink);
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
      const SizedBox(
        width: 10.0,
      ),
      ConnectCardWidget(
          connectString: "pranav-dave",
          connectSymbol: Images.stack,
          connectType: "Stack Overflow",
          onTap: () async {
            try {
              await launchURL(Strings.stackOverflowLink);
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
      const SizedBox(
        width: 10.0,
      ),
      ConnectCardWidget(
          connectString: "pranavdave__",
          connectSymbol: Images.insta,
          connectType: "Instagram",
          onTap: () async {
            try {
              await launchURL(Strings.instagramLink);
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
    ],
  ),
];
