import 'package:flutter/material.dart';
import 'package:pranavdave/src/utils/theme/theme.dart';
import 'package:pranavdave/src/utils/const/strings.dart';
import 'package:pranavdave/src/utils/theme/theme_provider.dart';
import 'package:pranavdave/src/presentation/views/landing/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.name,
          theme: themeModel.isDarkMode ? darkTheme : lightTheme,
          home: const LandingPage(),
        );
      },
    );
  }
}
