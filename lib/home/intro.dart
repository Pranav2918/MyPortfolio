import 'package:animbutton/animbutton.dart';
import 'package:pranavdave/utils/imports.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Tween animation
    _animation = Tween(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Repeat the animation indefinitely
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 450 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 90 : 10),
      color: Colors.white,
      child: Responsive.isDesktop(context)
          ? _rendenBigScreenContent()
          : _renderSmallScreenContent(),
    );
  }

  //Content to show on desktop or laptop
  Widget _rendenBigScreenContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "Hey There! I'm",
                color: Colors.black,
                fontSize: 14,
              ),
              const SizedBox(height: 5.0),
              const AppText(
                text: 'Pranav Dave',
                color: AppColors.primaryPurple,
                fontSize: 30,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              const SizedBox(height: 5.0),
              const AppText(
                text: 'Flutter Application Developer',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
              const SizedBox(height: 20.0),
              AnimButton(
                  label: 'LinkedIn',
                  buttonColor: AppColors.primaryPurple,
                  height: 40,
                  width: 100,
                  textStyle:
                      GoogleFonts.aBeeZee(fontSize: 13, color: Colors.white),
                  onPressed: () {
                    UrlLauncher.launchURL(AppConst.linkedinUrl);
                  })
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation.value),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/intro.png"))),
                  ),
                );
              }),
        )
      ],
    );
  }

  //Content to show on mobile Devices
  Widget _renderSmallScreenContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0),
        const AppText(
          text: "Hey There! I'm",
          color: Colors.black,
          fontSize: 14,
        ),
        const SizedBox(height: 5.0),
        const AppText(
          text: 'Pranav Dave',
          color: AppColors.primaryPurple,
          fontSize: 30,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
        const SizedBox(height: 5.0),
        const AppText(
          text: 'Flutter Application Developer',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
        const SizedBox(height: 20.0),
        AnimButton(
            label: 'LinkedIn',
            buttonColor: AppColors.primaryPurple,
            height: 40,
            width: 120,
            onPressed: () {
              UrlLauncher.launchURL(AppConst.linkedinUrl);
            }),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
