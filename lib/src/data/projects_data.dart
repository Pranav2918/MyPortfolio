import 'package:flutter/material.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/const/strings.dart';

class ProjectModel {
  ProjectModel({
    required this.appLogo,
    required this.name,
    required this.description,
    required this.projectImage,
    required this.onTap,
  });
  final String appLogo;
  final String name;
  final String description;
  final String projectImage;
  final VoidCallback onTap;
}

List<ProjectModel> projects = [
  ProjectModel(
    appLogo: 'assets/images/coupinoLogo.png',
    name: 'Coupino',
    description:
        'A local deals platform that helps small businesses connect with nearby customers through exclusive vouchers and attractive offers.',
    projectImage: 'assets/images/coupinos.jpg',
    onTap: () {},
  ),
  ProjectModel(
    appLogo: 'assets/images/piattoLogo.png',
    name: 'Piatto Chat',
    description:
        'A social chat application with an interactive map view that lets users discover friends, share feeds, and engage with communities in real time.',
    projectImage: 'assets/images/piatto.jpg',
    onTap: () {},
  ),
  ProjectModel(
    appLogo: 'assets/images/flutterLogo.png',
    name: 'Animbutton',
    description:
        'A Flutter package for creating elegant, animated buttons with customizable styles, smooth transitions, and cross-platform support.',
    projectImage: 'assets/images/animbutton.jpg',
    onTap: () async {
      try {
        await launchURL(Strings.animButtonLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
  ProjectModel(
    appLogo: 'assets/images/flutterLogo.png',
    name: 'Ticket Booking App',
    description:
        'A modern ticketing solution that allows users to seamlessly book tickets for movies, concerts, and events with secure payments and easy access.',
    projectImage: 'assets/images/ticket.jpg',
    onTap: () async {
      try {
        await launchURL(Strings.ticketLink);
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    },
  ),
];

