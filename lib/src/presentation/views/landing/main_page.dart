import 'package:flutter/material.dart';
import 'package:pranavdave/src/presentation/views/about/about.dart';
import 'package:pranavdave/src/presentation/views/connect/connects.dart';
import 'package:pranavdave/src/presentation/views/intro/intro.dart';
import 'package:pranavdave/src/presentation/views/project/projects.dart';
import 'package:pranavdave/src/presentation/widgets/source_code_btn.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/const/images.dart';
import 'package:pranavdave/src/utils/const/strings.dart';
import 'package:pranavdave/src/utils/sizer.dart';
import 'package:pranavdave/src/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Intro(),
      const About(),
      const Projects(),
      const Placeholder(),
      const Connect(),
    ];

    return Scaffold(
      appBar: !ResponsiveScreenProvider.isDesktopScreen(context)
          ? _smHeaderNav()
          : _lgHeaderNav(),
      endDrawer: !ResponsiveScreenProvider.isDesktopScreen(context)
          ? _showDrawer(context)
          : null,
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, selIndex, child) => screens[selIndex],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dark_mode),
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
        },
      ),
    );
  }

  void onIndexTapped(int index) {
    selectedIndex.value = index;
  }

  //Header Navigation for large screens
  AppBar _lgHeaderNav() => AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    onIndexTapped(0);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Images.dash,
                        height: 80.0,
                        width: 80.0,
                      ),
                      Text(
                        Strings.name.replaceAll(Strings.name, 'Pranav Dave'),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: _headerButtonStyle(),
                    onPressed: () => onIndexTapped(1),
                    child: Text(
                      'About',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  TextButton(
                    style: _headerButtonStyle(),
                    onPressed: () => onIndexTapped(3),
                    child: Text(
                      'Projects',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  TextButton(
                    style: _headerButtonStyle(),
                    onPressed: () => onIndexTapped(2),
                    child: Text(
                      'Blogs',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  TextButton(
                    style: _headerButtonStyle(),
                    onPressed: () => onIndexTapped(4),
                    child: Text(
                      'Connect',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Tooltip(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    message: 'Download Resume',
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    child: TextButton(
                      onPressed: () async {
                        try {
                          await launchURL(Strings.resumeLink);
                        } catch (e) {
                          debugPrint('Error launching URL: $e');
                        }
                      },
                      child: Text(
                        'Resume',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.blueAccent,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25.0),
                  const SourceCodeButton(
                    width: 30.0,
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  //Header Navigation for small screens (Mobile, Tablet)
  AppBar _smHeaderNav() => AppBar(
        title: GestureDetector(
          onTap: () {
            onIndexTapped(0);
          },
          child: Row(
            children: [
              Image.asset(
                Images.dash,
                height: 80.0,
                width: 80.0,
              ),
              Text(Strings.name.replaceAll(Strings.name, 'Pranav Dave'), style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      );

  //Drawer
  Drawer _showDrawer(BuildContext context) => Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onIndexTapped(1);
            },
            child: Text(
              'About',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: Sizer.screenHeight * 0.02),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onIndexTapped(2);
            },
            child: Text(
              'Projects',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: Sizer.screenHeight * 0.02),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onIndexTapped(3);
            },
            child: Text(
              'Blogs',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: Sizer.screenHeight * 0.02),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onIndexTapped(4);
            },
            child: Text(
              'Connect',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: Sizer.screenHeight * 0.02),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await launchURL(Strings.resumeLink);
              } catch (e) {
                debugPrint('Error launching URL: $e');
              }
            },
            child: Text(
              'Resume',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.blueAccent),
            ),
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: SourceCodeButton(height: 55.0, width: 55.0),
          ),
        ],
      ),
    );

  //Button Style
  ButtonStyle _headerButtonStyle() => ButtonStyle(
        overlayColor:
            WidgetStateProperty.resolveWith((states) => Colors.transparent),
      );
}
