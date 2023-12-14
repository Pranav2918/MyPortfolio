import 'package:pranavdave/utils/imports.dart';

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
                        ? const Column(
                            children: [Intro(), CustomDivider()],
                          )
                        : index == 1
                            ? const Column(
                                children: [About(), CustomDivider()],
                              )
                            : index == 2
                                ? const Column(
                                    children: [Skills(), CustomDivider()],
                                  )
                                : index == 3
                                    ? const Column(
                                        children: [Projects(), CustomDivider()],
                                      )
                                    : const Column(
                                        children: [Intro(), CustomDivider()],
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
        child: const Icon(Icons.keyboard_arrow_up_rounded),
      ),
    );
  }

  ///This will scroll list at desired position
  Future _scrollToDesiredIndex(int scrollIndex) async {
    await controller.scrollToIndex(scrollIndex,
        preferPosition: AutoScrollPosition.begin);
  }
}
