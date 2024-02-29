import 'package:pranavdave/common/imports.dart';

class TextWithImage extends StatelessWidget {
  final String text;
  final String image;
  const TextWithImage({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        )
      ],
    );
  }
}
