import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    dialogBackgroundColor: colorLightWhite,
    hintColor: colorDark1,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    canvasColor: backgroundColorLight,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: primaryColor,
    disabledColor: darkModeTextLight3,
    cardColor: darkModeSectionColor,
    scaffoldBackgroundColor: backgroundColor,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: darkModeTextLight1, selectionColor: darkModeTextLight3),
    primaryIconTheme: const IconThemeData(color: darkModeTextLight2),
    iconTheme: const IconThemeData(color: colorLightWhite),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: colorLightWhite,
        fontSize: 14,
        letterSpacing: 0.8,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: colorLightWhite,
      ),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorLightWhite,
          fontSize: 32,
          fontFamily: "Roboto"),
      headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorLightWhite,
          fontSize: 24,
          fontFamily: "Roboto"),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorLightWhite,
        fontSize: 20,
        fontFamily: "Roboto",
      ),
      bodyLarge: TextStyle(
          fontSize: 16, color: darkModeTextLight2, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 14, color: darkModeTextLight2, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 14, color: colorLightWhite, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
          fontSize: 16, color: colorLightWhite, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: darkModeTextLight2),
      labelSmall: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w500, color: darkModeTextLight3),
    ),
  );

  static final lightTheme = ThemeData(
      dialogBackgroundColor: backgroundColorLight,
      hintColor: colorLightWhite,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      canvasColor: colorLight2,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: colorDark3, selectionColor: colorLight3),
      cardColor: colorLight2,
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      //brightness: Brightness.light,
      primaryColor: primaryColor,
      disabledColor: colorLight3,
      scaffoldBackgroundColor: colorLightWhite,
      iconTheme: const IconThemeData(color: colorDark1),
      primaryIconTheme: const IconThemeData(color: colorDark3),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          color: colorLightWhite,
          fontSize: 14,
          letterSpacing: 0.8,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: colorDark1,
        ),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorDark1,
            fontSize: 32,
            fontFamily: "Roboto"),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorDark1,
            fontSize: 24,
            fontFamily: "Roboto"),
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorDark1,
            fontSize: 20,
            fontFamily: "Roboto"),
        bodyLarge: TextStyle(
            fontSize: 16, color: colorDark3, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            fontSize: 14, color: colorDark3, fontWeight: FontWeight.w400),
        titleSmall: TextStyle(
            fontSize: 14, color: colorDark1, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 16, color: colorDark1, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: colorDark3),
        labelSmall: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w500, color: colorLight3),
      ));
}
