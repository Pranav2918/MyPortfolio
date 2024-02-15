import 'package:flutter/material.dart';
import 'package:pranavdave/common/responsive.dart';
import 'package:pranavdave/views/about.dart';
import 'package:pranavdave/views/connects.dart';
import 'package:pranavdave/views/education.dart';
import 'package:pranavdave/views/intro.dart';
import 'package:pranavdave/views/projects.dart';
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
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? _lgHeaderNav()
          : _smHeaderNav(),
      endDrawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : _showDrawer(context),
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
                child: Text('Pranav Dave',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(1),
                  child: Text('About',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(2),
                  child: Text('Education',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(3),
                  child: Text('Projects',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                TextButton(
                  style: _headerButtonStyle(),
                  onPressed: () => onIndexTapped(4),
                  child: Text('Connect',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                //Add Resume button here
              ],
            )
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
            Text('Pranav Dave', style: Theme.of(context).textTheme.labelLarge),
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
              child: Text("About",
                  style: Theme.of(context).textTheme.displayMedium)),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(2);
              },
              child: Text(
                "Education",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(3);
              },
              child: Text(
                "Projects",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                onIndexTapped(4);
              },
              child: Text(
                "Connect",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "© 2024 Pranav Dave. All rights reserved.",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          GestureDetector(
            onTap: (){
              
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/github.png",
                height: 40.0,
                width: 40.0,
                color: Colors.brown,
              ),
            ),
          )
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
