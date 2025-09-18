import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pranavdave/src/data/connect_data.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/sizer.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveScreenProvider.isDesktopScreen(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: Sizer.screenHeight * 0.05),
          SelectableText(
            'CONNECT',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 35.0,
                  letterSpacing: 2.0,
                ),
          ),
          const SizedBox(height: 25.0),
          SelectableText(
            isDesktop
                ? 'Use social media and other communication platforms to get in touch with me.'
                : 'Use social media and other communication platforms\nto get in touch with me',
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.grey,
                  letterSpacing: isDesktop ? 1.0 : null,
                ),
          ),
          SizedBox(height: Sizer.screenHeight * 0.02),
          isDesktop
              ? const LargeScreenConnectCards()
              : const MediumScreenConnectCards(),
        ],
      ),
    );
  }
}

class MediumScreenConnectCards extends StatelessWidget {
  const MediumScreenConnectCards({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: connections.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 55.0),
          child: _ConnectionCard(connection: connections[index]),
        ),
      );
}

class LargeScreenConnectCards extends StatelessWidget {
  const LargeScreenConnectCards({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ConnectionCard(connection: connections[0]),
              const SizedBox(width: 15.0),
              _ConnectionCard(connection: connections[1]),
              const SizedBox(width: 15.0),
              _ConnectionCard(connection: connections[2]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ConnectionCard(connection: connections[3]),
              const SizedBox(width: 15.0),
              _ConnectionCard(connection: connections[4]),
              const SizedBox(width: 15.0),
              _ConnectionCard(connection: connections[5]),
            ],
          ),
        ],
      );
}

/// Reusable connection card
class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({required this.connection});

  final ConnectModel connection;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: connection.onTap,
        child: Card(
          child: SizedBox(
            width: 230.0,
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(connection.connectSymbol,
                    height: 40.0,
                    width: 40.0,
                    colorFilter: const ColorFilter.mode(
                        Colors.blueAccent, BlendMode.srcIn)),
                const SizedBox(height: 5.0),
                Text(
                  connection.connectType,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 15, letterSpacing: 1.0),
                ),
                const SizedBox(height: 5.0),
                SelectableText(
                  connection.connectString,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
}
