import 'package:animbutton/animbutton.dart';
import 'package:pranavdave/utils/imports.dart';

class About extends StatefulWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 471 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 100 : 20),
      child: Responsive.isDesktop(context)
          ? _renderLargeScreenAboutSection()
          : _renderSmallScreenAboutSection(),
    );
  }

  Widget _renderLargeScreenAboutSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/aboutme.png',
              height: 300,
              width: 300,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "About Me",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              const SizedBox(height: 10.0),
              const AppText(
                text: Strings.about,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  Expanded(
                    child: _showUrlButtons(
                        AppConst.resumeLink, AppColors.primaryPurple, "Resume"),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: _showUrlButtons(AppConst.stackoverflow,
                        Colors.orangeAccent, "StackOverflow"),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: _showUrlButtons(
                        AppConst.animButton, Colors.blue, "Animbutton"),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderSmallScreenAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            'assets/images/aboutme.png',
            height: 200,
            width: 200,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: "About Me",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
            const SizedBox(height: 10.0),
            const AppText(
              text: Strings.about,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: _showUrlButtons(
                      AppConst.resumeLink, AppColors.primaryPurple, "Resume"),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: _showUrlButtons(AppConst.stackoverflow,
                      Colors.orangeAccent, "StackOverflow"),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: _showUrlButtons(
                      AppConst.animButton, Colors.blue, "Animbutton"),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _showUrlButtons(String urls, Color color, String buttonText) {
    return AnimButton(
        label: buttonText,
        height: 40.0,
        width: 100.0,
        buttonColor: color,
        textStyle: GoogleFonts.aBeeZee(fontSize: 13, color: Colors.white),
        onPressed: () {
          UrlLauncher.launchURL(urls);
        });
  }
}
