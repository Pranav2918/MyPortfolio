import 'package:pranavdave/common/imports.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SelectableText(
            "CONNECT",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 35.0, letterSpacing: 2.0),
          ),
          const SizedBox(height: 25.0),
          !ResponsiveScreenProvider.isDesktopScreen(context)
              ? SelectableText(
                  "Use social media and other communication platforms\nto get in touch with me",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey),
                )
              : SelectableText(
                  "Use social media and other communication platforms to get in touch with me.",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey, letterSpacing: 1.0),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          !ResponsiveScreenProvider.isDesktopScreen(context)
              ? const MDScreensConnectCards()
              : const DesktopConnectCards()
        ],
      ),
    );
  }
}

//Desktop Cards
class DesktopConnectCards extends StatelessWidget {
  const DesktopConnectCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConnectCardWidget(
                connectString: "pranav.18.dave@gmail.com",
                connectSymbol: "assets/images/mail.svg",
                connectType: "Mail",
                onTap: () async {
                  try {
                    await launchURL('mailto:pranav.18.dave@gmail.com');
                  } catch (e) {
                    debugPrint('Error launching URL: $e');
                  }
                }),
            const SizedBox(
              width: 10.0,
            ),
            ConnectCardWidget(
                connectString: "+91-7016156637",
                connectSymbol: "assets/images/phone.svg",
                connectType: "Phone",
                onTap: () {}),
            const SizedBox(
              width: 10.0,
            ),
            ConnectCardWidget(
                connectString: "in/pranav-dave",
                connectSymbol: "assets/images/linkedin.svg",
                connectType: "LinkedIn",
                onTap: () async {
                  try {
                    await launchURL(
                        'https://www.linkedin.com/in/pranav-dave-3a56931ba/');
                  } catch (e) {
                    debugPrint('Error launching URL: $e');
                  }
                }),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConnectCardWidget(
                connectString: "Pranav2918",
                connectSymbol: "assets/images/github.svg",
                connectType: "Github",
                onTap: () async {
                  try {
                    await launchURL('https://github.com/Pranav2918');
                  } catch (e) {
                    debugPrint('Error launching URL: $e');
                  }
                }),
            const SizedBox(
              width: 10.0,
            ),
            ConnectCardWidget(
                connectString: "pranav-dave",
                connectSymbol: "assets/images/stack_of.svg",
                connectType: "Stack Overflow",
                onTap: () async {
                  try {
                    await launchURL(
                        'https://stackoverflow.com/users/16584937/pranav-dave');
                  } catch (e) {
                    debugPrint('Error launching URL: $e');
                  }
                }),
            const SizedBox(
              width: 10.0,
            ),
            ConnectCardWidget(
                connectString: "pranavdave__",
                connectSymbol: "assets/images/insta.svg",
                connectType: "Instagram",
                onTap: () async {
                  try {
                    await launchURL('https://instagram.com/pranavdave__');
                  } catch (e) {
                    debugPrint('Error launching URL: $e');
                  }
                }),
          ],
        ),
      ],
    );
  }
}

class MDScreensConnectCards extends StatelessWidget {
  const MDScreensConnectCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ConnectCardWidget(
              connectString: "pranav.18.dave@gmail.com",
              connectSymbol: "assets/images/mail.svg",
              connectType: "Mail",
              onTap: () async {
                try {
                  await launchURL('mailto:pranav.18.dave@gmail.com');
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                }
              }),
          const SizedBox(
            height: 10.0,
          ),
          ConnectCardWidget(
              connectString: "+91-7016156637",
              connectSymbol: "assets/images/phone.svg",
              connectType: "Phone",
              onTap: () {}),
          const SizedBox(
            height: 10.0,
          ),
          ConnectCardWidget(
              connectString: "in/pranav-dave",
              connectSymbol: "assets/images/linkedin.svg",
              connectType: "LinkedIn",
              onTap: () async {
                try {
                  await launchURL(
                      'https://www.linkedin.com/in/pranav-dave-3a56931ba/');
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                }
              }),
          ConnectCardWidget(
              connectString: "Pranav2918",
              connectSymbol: "assets/images/github.svg",
              connectType: "Github",
              onTap: () async {
                try {
                  await launchURL('https://github.com/Pranav2918');
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                }
              }),
          const SizedBox(
            height: 10.0,
          ),
          ConnectCardWidget(
              connectString: "pranav-dave",
              connectSymbol: "assets/images/stack_of.svg",
              connectType: "Stack Overflow",
              onTap: () async {
                try {
                  await launchURL(
                      'https://stackoverflow.com/users/16584937/pranav-dave');
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                }
              }),
          const SizedBox(
            height: 10.0,
          ),
          ConnectCardWidget(
              connectString: "pranavdave__",
              connectSymbol: "assets/images/insta.svg",
              connectType: "Instagram",
              onTap: () async {
                try {
                  await launchURL('https://instagram.com/pranavdave__');
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                }
              }),
        ],
      ),
    );
  }
}

class ConnectCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String connectSymbol;
  final String connectType;
  final String connectString;
  const ConnectCardWidget(
      {super.key,
      required this.connectString,
      required this.connectSymbol,
      required this.connectType,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          width: 230.0,
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(connectSymbol,
                  height: 40.0,
                  width: 40.0,
                  colorFilter: const ColorFilter.mode(
                      Colors.blueAccent, BlendMode.srcIn)),
              const SizedBox(height: 5.0),
              Text(
                connectType,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 15, letterSpacing: 1.0),
              ),
              const SizedBox(height: 5.0),
              SelectableText(
                connectString,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
