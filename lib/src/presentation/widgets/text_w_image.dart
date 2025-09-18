import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextWithImage extends StatelessWidget {
  const TextWithImage({required this.text, required this.image, super.key});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) => Row(
      children: [
        SvgPicture.asset(
          image,
          height: 35,
          width: 35,
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
        ),
        const SizedBox(width: 15.0),
        SelectableText(
          text,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 18),
          maxLines: 2,
        ),
      ],
    );
}
