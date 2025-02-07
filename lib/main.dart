import 'package:flutter/material.dart';
import 'package:pranavdave/common/theme.dart';
import 'package:pranavdave/src/utils/const/const.dart';
import 'package:pranavdave/theme_provider.dart';
import 'package:pranavdave/views/main_page.dart';
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
          title: Constants.name,
          theme: themeModel.isDarkMode ? darkTheme : lightTheme,
          home: const MainPage(),
        );
      },
    );
  }
}
