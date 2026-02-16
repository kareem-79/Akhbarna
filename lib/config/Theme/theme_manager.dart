import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class ThemeManager{
  static final ThemeData dark =ThemeData(
    scaffoldBackgroundColor: ColorsManagers.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManagers.gray,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManagers.blue,
      unselectedItemColor: ColorsManagers.white.withOpacity(.6),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
  );
  static final ThemeData light =ThemeData(

  );
}
