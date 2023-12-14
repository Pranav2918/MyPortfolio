import 'package:pranavdave/utils/imports.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? _renderWebContent(context)
        : _renderPhoneContent(context);
  }

  Widget _projectCard(String projectTitle, String projectDesc,
      String githubLink, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width / 5
          : MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withOpacity(0.2),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppText(
            text: projectTitle,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0),
        const SizedBox(height: 10.0),
        AppText(
            text: projectDesc,
            color: AppColors.headerGrey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.justify),
        githubLink.isNotEmpty
            ? Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    elevation: 3.0,
                    backgroundColor: Colors.brown,
                    onPressed: () {
                      UrlLauncher.launchURL(githubLink);
                    },
                    child: const Center(
                        child: Icon(Icons.code, color: Colors.white)),
                  ),
                ))
            : Container()
      ]),
    );
  }

  Widget _renderWebContent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _projectCard(
                projectList[0].title, projectList[0].description, '', context),
            _projectCard(
                projectList[1].title, projectList[1].description, '', context),
            _projectCard(projectList[2].title, projectList[2].description,
                '', context)
          ],
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _projectCard(projectList[3].title, projectList[3].description,
                '', context),
            _projectCard(projectList[4].title, projectList[4].description,
                '', context),
            _projectCard(projectList[5].title, projectList[5].description,
                '', context)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _projectCard(projectList[6].title, projectList[6].description,
                projectList[6].gitHub!, context),
            _projectCard(projectList[7].title, projectList[7].description,
                projectList[7].gitHub!, context),
            _projectCard(projectList[8].title, projectList[8].description,
                projectList[8].gitHub!, context),
          ],
        ),
        _webFooter(context)
      ],
    );
  }

  Widget _renderPhoneContent(BuildContext context) {
    return Column(
      children: [
        _projectCard(
            projectList[0].title, projectList[0].description, '', context),
        _projectCard(
            projectList[1].title, projectList[1].description, '', context),
        _projectCard(projectList[2].title, projectList[2].description,
            projectList[2].gitHub!, context),
        _projectCard(projectList[3].title, projectList[3].description,
            projectList[3].gitHub!, context),
        _projectCard(projectList[4].title, projectList[4].description,
            projectList[4].gitHub!, context),
        _projectCard(projectList[5].title, projectList[5].description,
            projectList[5].gitHub!, context),
        _projectCard(projectList[6].title, projectList[6].description,
            projectList[6].gitHub!, context),
        _mobileFooter(context)
      ],
    );
  }

  Widget _webFooter(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryPurple.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          _renderFooterWidget(
              const Icon(
                Icons.call,
                color: Colors.white,
              ),
              '+91-7016156637'),
          const Expanded(child: SizedBox()),
          _renderFooterWidget(
              const Icon(
                Icons.mail_outline_sharp,
                color: Colors.white,
              ),
              'pranav.18.dave@gmail.com'),
          const Expanded(child: SizedBox()),
          _renderFooterWidget(
              const Icon(
                Icons.code,
                color: Colors.white,
              ),
              'https://github.com/Pranav2918'),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _mobileFooter(BuildContext context) {
    return Container(
      height: 50,
      color: AppColors.primaryPurple.withOpacity(0.5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 8.0),
          Icon(
            Icons.call,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: AppText(
              text: '+91 7016156637',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
          Icon(
            Icons.email_outlined,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: AppText(
              text: 'pranav.18.dave@gmail.com',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }

  //Show footer option
  Widget _renderFooterWidget(Widget icon, String title) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 10.0),
        AppText(
          text: title,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        )
      ],
    );
  }
}
