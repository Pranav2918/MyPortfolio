import 'package:flutter/material.dart';
import 'package:pranavdave/src/data/connect_data.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SelectableText(
            'CONNECT',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 35.0, letterSpacing: 2.0),
          ),
          const SizedBox(height: 25.0),
          !ResponsiveScreenProvider.isDesktopScreen(context)
              ? SelectableText(
                  'Use social media and other communication platforms\nto get in touch with me',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey),
                )
              : SelectableText(
                  'Use social media and other communication platforms to get in touch with me.',
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
              : const DesktopConnectCards(),
        ],
      ),
    );
}

//Desktop Cards
class DesktopConnectCards extends StatelessWidget {
  const DesktopConnectCards({super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: connectCardLG,
    );
}

class MDScreensConnectCards extends StatelessWidget {
  const MDScreensConnectCards({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Column(
        children: connectionOptionsMD,
      ),
    );
}
