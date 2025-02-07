import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pranavdave/common/responsive.dart';
import 'package:pranavdave/common/url_launcher_function.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> lgCardsList = [
      LGScreenProjectCards(
          projectImage: "assets/images/coupinos.jpg", onTap: () {}),
      LGScreenProjectCards(
          projectImage: "assets/images/piatto.jpg", onTap: () {}),
      LGScreenProjectCards(
          projectImage: "assets/images/animbutton.jpg",
          onTap: () async {
            try {
              await launchURL('https://pub.dev/packages/animbutton');
            } catch (e) {
              debugPrint('Error launching URL: $e');
            }
          }),
      LGScreenProjectCards(
        projectImage: "assets/images/sod.jpg",
        onTap: () async {
          try {
            await launchURL('https://github.com/Pranav2918/FlutterDesigns');
          } catch (e) {
            debugPrint('Error launching URL: $e');
          }
        },
      )
      // Add more cards as needed
    ];

    final List<Widget> mdCardsList = [
      MDScreenProjectCards(
        appLogo: "assets/images/coupinoLogo.png",
        name: "Coupino",
        description:
            "Support the business in your direct neighbourhood and benefit from attractive vouchers and offers",
        onTap: () {},
      ),
      MDScreenProjectCards(
        appLogo: "assets/images/piattoLogo.png",
        name: "Piatto Chat",
        description:
            "An application for chat that lets users browse their friends on a map, talk, submit feeds, and interact with feeds over a place.",
        onTap: () {},
      ),
      MDScreenProjectCards(
        appLogo: "assets/images/flutterLogo.png",
        name: "Animbutton",
        description:
            " Elegant UI interactions with smooth animations, customizable styles, and seamless integration across the platforms.",
        onTap: () async {
          try {
            await launchURL('https://pub.dev/packages/animbutton');
          } catch (e) {
            debugPrint('Error launching URL: $e');
          }
        },
      ),
      MDScreenProjectCards(
        appLogo: "assets/images/flutterLogo.png",
        name: "Sea of Designs",
        description:
            "A collection that includes several Flutter designs, such as travel, social networking, and authentication designs, among others",
        onTap: () async {
          try {
            await launchURL('https://github.com/Pranav2918/FlutterDesigns');
          } catch (e) {
            debugPrint('Error launching URL: $e');
          }
        },
      ),
    ];
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                SelectableText(
                  "PROJECTS",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 35.0, letterSpacing: 2.0),
                ),
                !ResponsiveScreenProvider.isDesktopScreen(context)
                    ? SelectableText(
                        "View my projects, crafted with Flutter",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey),
                      )
                    : SelectableText(
                        "View my projects, crafted with Flutter",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey, letterSpacing: 1.0),
                      ),
                const SizedBox(height: 25.0),
                CarouselSlider(
                  items: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? mdCardsList
                      : lgCardsList,
                  options: CarouselOptions(
                    height: !ResponsiveScreenProvider.isDesktopScreen(context)
                        ? MediaQuery.of(context).size.height * 0.50
                        : MediaQuery.of(context).size.height * 0.50,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      // Handle page change if needed
                    },
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                TextButton(
                    onPressed: () async {
                      try {
                        await launchURL(
                            'https://github.com/Pranav2918?tab=repositories');
                      } catch (e) {
                        debugPrint('Error launching URL: $e');
                      }
                    },
                    child: const Text("See More on Github"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Project cards for desktop, Landscape
class LGScreenProjectCards extends StatefulWidget {
  final String projectImage;
  final VoidCallback onTap;
  const LGScreenProjectCards(
      {super.key, required this.projectImage, required this.onTap});

  @override
  State<LGScreenProjectCards> createState() => _LGScreenProjectCardsState();
}

class _LGScreenProjectCardsState extends State<LGScreenProjectCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
      onTap: widget.onTap,
      child: Card(
        child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 2,
              widget.projectImage,
            ),
          ),
        ),
      ),
    );
  }
}

//Project cards for small devices (Tablet, Phone)
class MDScreenProjectCards extends StatelessWidget {
  final String name;
  final String appLogo;
  final VoidCallback onTap;
  final String description;
  const MDScreenProjectCards(
      {super.key,
      required this.name,
      required this.appLogo,
      required this.onTap,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
      onTap: onTap,
      child: Card(
        child: SizedBox(
          width: 300.0,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(appLogo), fit: BoxFit.cover),
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    letterSpacing: 1.0),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(letterSpacing: 1.0, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
