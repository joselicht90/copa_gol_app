import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFFFE0000),
      onPrimary: Colors.white,
      primaryVariant: Color(0xFFFBD52E),
      background: Color(0xFFF8F8F8),
      onBackground: Colors.black,
      secondary: Color(0xFF56FB1C),
      onSecondary: Colors.white,
      secondaryVariant: Color(0xFF999894),
      error: Color(0xFFFE0000),
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(
            15,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFEDEDED),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFFE0000),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(
        headline5: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        headline6: TextStyle(
          color: Color(0xFF999894),
          fontSize: 13,
        ),
      ),
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      primary: Color(0xFFFE0000),
      onPrimary: Colors.black,
      primaryVariant: Color(0xFFFBD52E),
      background: Color(0xFF3A3A3A),
      onBackground: Color(0xFFF8F8F8),
      secondary: Color(0xFF56FB1C),
      onSecondary: Colors.black,
      secondaryVariant: Color(0xFF999894),
      error: Color(0xFFFE0000),
      onError: Colors.black,
      surface: Colors.black,
      onSurface: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(
            15,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFEDEDED),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFFE0000),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFEDEDED),
        ),
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(
        headline5: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        headline6: TextStyle(
          color: Color(0xFF999894),
          fontSize: 13,
        ),
      ),
    ),
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
