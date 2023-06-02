import 'package:flutter/material.dart';
import 'package:pranavdave/about/about.dart';
import 'package:pranavdave/headerSection/header.dart';
import 'package:pranavdave/home/intro.dart';
import 'package:pranavdave/projects/projects.dart';
import 'package:pranavdave/skills/skills.dart';
import 'package:pranavdave/utils/responsive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: drawerKey,
      backgroundColor: Colors.white,
      drawer: Responsive.isDesktop(context) ? Container() : const Drawer(),
      body: SafeArea(
        child: Column(
          children: [
            Responsive.isDesktop(context)
                ? HeaderSection(
                    home: () {
                      _scrollToDesiredIndex(0);
                    },
                    about: () {
                      _scrollToDesiredIndex(1);
                    },
                    skill: () {
                      _scrollToDesiredIndex(2);
                    },
                    projects: () {
                      _scrollToDesiredIndex(3);
                    },
                  )
                : Container(),
            Expanded(
                child: ListView(
              controller: controller,
              children: List.generate(4, (index) {
                return AutoScrollTag(
                    key: ValueKey(index),
                    controller: controller,
                    index: index,
                    child: index == 0
                        ? const Intro()
                        : index == 1
                            ? const About()
                            : index == 2
                                ? const Skills()
                                : index == 3
                                    ? const Projects()
                                    : const Intro());
              }),
            ))
          ],
        ),
      ),
    );
  }

  ///This will scroll list at desired position
  Future _scrollToDesiredIndex(int scrollIndex) async {
    await controller.scrollToIndex(scrollIndex,
        preferPosition: AutoScrollPosition.begin);
  }
}
