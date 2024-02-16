import 'package:flutter/material.dart';
import 'package:pranavdave/common/responsive.dart';
import 'package:pranavdave/views/about.dart';
import 'package:pranavdave/views/connects.dart';
import 'package:pranavdave/views/education.dart';
import 'package:pranavdave/views/intro.dart';
import 'package:pranavdave/views/projects.dart';
import 'package:pranavdave/widgets/source_code_btn.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Intro(),
      const About(),
      const Education(),
      const Projects(),
      const Connect()
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
        builder: (context, selIndex, child) {
          return screens[selIndex];
        },
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
  AppBar _lgHeaderNav() {
    return AppBar(
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
                child: SelectableText('Pranav Dave',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(1),
                  child: SelectableText('About',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(2),
                  child: SelectableText('Education',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(3),
                  child: SelectableText('Projects',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(4),
                  child: SelectableText('Connect',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                //Add Resume button here
                const SizedBox(width: 25.0),
                const SourceCodeButton(
                  width: 30.0,
                  height: 30.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Header Navigation for small screens (Mobile, Tablet)
  AppBar _smHeaderNav() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          onIndexTapped(0);
        },
        child:
            SelectableText('Pranav Dave', style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }

  //Drawer
  Drawer _showDrawer(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(1);
              },
              child: SelectableText("About",
                  style: Theme.of(context).textTheme.displayMedium)),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(2);
              },
              child: SelectableText(
                "Education",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(3);
              },
              child: SelectableText(
                "Projects",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(4);
              },
              child: SelectableText(
                "Connect",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          const Expanded(child: SizedBox()),
          const Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: SourceCodeButton(height: 55.0, width: 55.0))
        ],
      ),
    );
  }

  //Button Style
  ButtonStyle _headerButtonStyle() {
    return ButtonStyle(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
    );
  }
}
