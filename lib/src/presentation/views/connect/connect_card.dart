import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
