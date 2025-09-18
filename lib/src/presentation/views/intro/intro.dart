import 'package:flutter/material.dart';
import 'package:pranavdave/src/presentation/views/intro/widgets/intro_text.dart';
import 'package:pranavdave/src/presentation/widgets/text_w_image.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/const/images.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = ResponsiveScreenProvider.isDesktopScreen(context);

    return isDesktop
        ? _introPageForLGScreen(screenSize)
        : _introPageForMDScreens(screenSize);
  }

  /// Intro section for large screens (Desktop, Landscape Tablets)
  Widget _introPageForLGScreen(Size screenSize) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const IntroText(),
                const Spacer(),
                Row(
                  children: [
                    _IntroRoles(
                      roles: const [
                        {'text': 'Computer Engineer', 'image': Images.engineer},
                        {'text': 'Flutter Developer', 'image': Images.flutter},
                      ],
                      spacing: screenSize.height * 0.02,
                    ),
                    const SizedBox(width: 20.0),
                    _IntroRoles(
                      roles: const [
                        {'text': 'Traveller', 'image': Images.travel},
                        {
                          'text': 'Community Contributor',
                          'image': Images.contributor,
                        },
                      ],
                      spacing: screenSize.height * 0.02,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.08),
            child: _AnimatedProfileImage(
              animation: _animation,
              size: 260.0,
            ),
          ),
        ],
      );

  /// Intro section for small/medium screens (Mobiles, Tablets)
  Widget _introPageForMDScreens(Size screenSize) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.08),
            Center(
              child: _AnimatedProfileImage(
                animation: _animation,
                size: 200.0,
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            const IntroText(),
            SizedBox(height: screenSize.height * 0.08),
            _IntroRoles(
              roles: const [
                {'text': 'Computer Engineer', 'image': Images.engineer},
                {'text': 'Flutter Developer', 'image': Images.flutter},
                {'text': 'Traveller', 'image': Images.travel},
                {'text': 'Community Contributor', 'image': Images.contributor},
              ],
              spacing: screenSize.height * 0.03,
            ),
            SizedBox(height: screenSize.height * 0.08),
          ],
        ),
      );
}

/// Animated profile image used in both layouts
class _AnimatedProfileImage extends StatelessWidget {
  const _AnimatedProfileImage({
    required this.animation,
    required this.size,
  });

  final Animation<double> animation;
  final double size;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
        child: Image.asset(
          Images.profileImage,
          height: size,
          width: size,
        ),
      );
}

/// Roles section with [TextWithImage] list
class _IntroRoles extends StatelessWidget {

  const _IntroRoles({
    required this.roles,
    this.spacing = 20.0,
  });
  final List<Map<String, String>> roles;
  final double spacing;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center, // ✅ Center horizontally
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // ✅ Align text + icons center
            children: roles
                .map(
                  (role) => Padding(
                    padding: EdgeInsets.only(bottom: spacing),
                    child: TextWithImage(
                      text: role['text']!,
                      image: role['image']!,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
}
