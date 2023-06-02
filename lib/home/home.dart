import 'package:flutter/material.dart';
import 'package:pranavdave/about/about.dart';
import 'package:pranavdave/headerSection/header.dart';
import 'package:pranavdave/home/intro.dart';
import 'package:pranavdave/projects/projects.dart';
import 'package:pranavdave/skills/skills.dart';
import 'package:pranavdave/utils/colors.dart';
import 'package:pranavdave/utils/responsive.dart';
import 'package:pranavdave/widgets/divider.dart';
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
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,
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
                        ? Column(
                            children: const [Intro(), CustomDivider()],
                          )
                        : index == 1
                            ? Column(
                                children: const [About(), CustomDivider()],
                              )
                            : index == 2
                                ? Column(
                                    children: const [Skills(), CustomDivider()],
                                  )
                                : index == 3
                                    ? Column(
                                        children: const [
                                          Projects(),
                                          CustomDivider()
                                        ],
                                      )
                                    : Column(
                                        children: const [
                                          Intro(),
                                          CustomDivider()
                                        ],
                                      ));
              }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollToDesiredIndex(0);
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primaryPurple),
          child: const Icon(Icons.keyboard_arrow_up_rounded),
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
