import 'package:flutter/material.dart';

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
      height: size.height,
      color: Colors.black,
    );
  }
}
