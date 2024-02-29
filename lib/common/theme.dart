import 'package:pranavdave/common/imports.dart';

//Light Theme
final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  brightness: Brightness.light,
  cardColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black, foregroundColor: Colors.white),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  textTheme: TextTheme(
      labelLarge: GoogleFonts.poppins(fontSize: 24, color: Colors.black),
      displaySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
      displayMedium: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
      bodySmall: GoogleFonts.abel(fontSize: 18, color: Colors.black)),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10), // Set the border radius
    ),
    elevation: 5.0, // Set the elevation (shadow)
    color: Colors.white, // Set the background color
    shadowColor: Colors.blueAccent.withOpacity(0.5), // Set the shadow color
  ),
);

//Dark Theme
final ThemeData darkTheme = ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      elevation: 5.0, // Set the elevation (shadow)
      color: Colors.black, // Set the background color
      shadowColor: Colors.blueAccent.withOpacity(0.5), // Set the shadow color
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white, foregroundColor: Colors.black),
    textTheme: TextTheme(
        displaySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        displayMedium: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
        bodySmall: GoogleFonts.abel(fontSize: 18, color: Colors.white),
        labelLarge: GoogleFonts.poppins(fontSize: 24, color: Colors.white)));
