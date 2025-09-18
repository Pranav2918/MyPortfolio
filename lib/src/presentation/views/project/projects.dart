import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pranavdave/src/data/projects_data.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/sizer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: Sizer.screenHeight * 0.05,
                ),
                SelectableText(
                  'PROJECTS',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 35.0, letterSpacing: 2.0),
                ),
                !ResponsiveScreenProvider.isDesktopScreen(context)
                    ? SelectableText(
                        'View my projects, crafted with Flutter',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey),
                      )
                    : SelectableText(
                        'View my projects, crafted with Flutter',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.grey, letterSpacing: 1.0),
                      ),
                const SizedBox(height: 25.0),
                CarouselSlider(
                  items: !ResponsiveScreenProvider.isDesktopScreen(context)
                      ? List.generate(
                          projects.length,
                          (index) => MDScreenProjectCards(
                            project: projects[index],
                          ),
                        )
                      : List.generate(
                          projects.length,
                          (index) => LGScreenProjectCards(
                            project: projects[index],
                          ),
                        ),
                  options: CarouselOptions(
                    height: Sizer.screenHeight * 0.50,
                    enlargeCenterPage: true,
                    viewportFraction:
                        ResponsiveScreenProvider.isDesktopScreen(context)
                            ? 0.6
                            : 0.7,
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
                        'https://github.com/Pranav2918?tab=repositories',
                      );
                    } catch (e) {
                      debugPrint('Error launching URL: $e');
                    }
                  },
                  child: const Text('See More on Github'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

//Project cards for desktop, Landscape
class LGScreenProjectCards extends StatefulWidget {
  const LGScreenProjectCards({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  State<LGScreenProjectCards> createState() => _LGScreenProjectCardsState();
}

class _LGScreenProjectCardsState extends State<LGScreenProjectCards> {
  @override
  Widget build(BuildContext context) => InkWell(
        overlayColor:
            WidgetStateProperty.resolveWith((states) => Colors.transparent),
        onTap: widget.project.onTap,
        child: Card(
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                fit: BoxFit.contain,
                height: Sizer.screenHeight / 2,
                widget.project.projectImage,
              ),
            ),
          ),
        ),
      );
}

//Project cards for small devices (Tablet, Phone)
class MDScreenProjectCards extends StatelessWidget {
  const MDScreenProjectCards({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(BuildContext context) => InkWell(
        overlayColor:
            WidgetStateProperty.resolveWith((states) => Colors.transparent),
        onTap: project.onTap,
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
                      image: AssetImage(project.appLogo),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        letterSpacing: 1.0,
                      ),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    project.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(letterSpacing: 1.0, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
