import 'package:pranavdave/common/imports.dart';

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
          title: 'Pranav Dave',
          theme: themeModel.isDarkMode ? darkTheme : lightTheme,
          home: const MainPage(),
        );
      },
    );
  }
}
