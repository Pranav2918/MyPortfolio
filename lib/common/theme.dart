import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Light Theme
final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black, foregroundColor: Colors.white),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      labelLarge: GoogleFonts.poppins(fontSize: 24, color: Colors.black),
      displaySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
      displayMedium: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
      bodySmall: GoogleFonts.abel(fontSize: 18, color: Colors.black)
    ));

//Dark Theme
final ThemeData darkTheme = ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
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
