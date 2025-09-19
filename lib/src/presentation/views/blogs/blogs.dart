import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pranavdave/src/data/blogs_data.dart';
import 'package:pranavdave/src/services/launch_url.dart';
import 'package:pranavdave/src/utils/configs/responsive.dart';
import 'package:pranavdave/src/utils/sizer.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: Sizer.screenHeight * 0.05,
                  ),
                  Text(
                    'BLOGS',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 35.0, letterSpacing: 2.0),
                  ),
                  SizedBox(
                    height: Sizer.screenHeight * 0.03,
                  ),
                  ResponsiveScreenProvider.isDesktopScreen(context)
                      ? Text(
                          'I share my learnings, experiences, and ideas through blogs\non technology, Flutter, and beyond.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.grey),
                        )
                      : Text(
                          'I share my learnings, experiences, and ideas through blogs\non technology, Flutter, and beyond.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.grey, letterSpacing: 1.0),
                        ),
                  ResponsiveScreenProvider.isDesktopScreen(context)
                      ? const LargeScreenBlogsView()
                      : const Text("Show mob view"),
                  const SizedBox(
                    height: 35.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await launchURL(
                          'https://medium.com/@pranavdave.code',
                        );
                      } catch (e) {
                        debugPrint('Error launching URL: $e');
                      }
                    },
                    child: const Text('See More on Medium'),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

class LargeScreenBlogsView extends StatelessWidget {
  const LargeScreenBlogsView({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Container(
        height: Sizer.screenHeight * 0.52,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: Sizer.screenWidth * 0.09),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: blogs.length,
            itemBuilder: (context, index) => Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: _HoverBlogCard(blog: blogs[index]),
            ),
          ),
        ),
      ),
    );
}

class _HoverBlogCard extends StatefulWidget {
  const _HoverBlogCard({required this.blog});
  final BlogModel blog;

  @override
  State<_HoverBlogCard> createState() => _HoverBlogCardState();
}

class _HoverBlogCardState extends State<_HoverBlogCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        child: Card(
          elevation: _isHovered ? 10 : 5,
          shadowColor: Colors.blueAccent.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.white,
          child: SizedBox(
            width: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    widget.blog.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    widget.blog.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
}