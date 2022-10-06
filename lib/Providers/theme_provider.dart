import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool inOn) {
    themeMode = inOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.white,
    secondaryHeaderColor: const Color(0xff363636),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(color: Color(0xff363636)),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.black,
    secondaryHeaderColor: const Color.fromARGB(255, 223, 223, 223),
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(color: Colors.blueAccent),
    dividerColor: Colors.grey,
  );
}
