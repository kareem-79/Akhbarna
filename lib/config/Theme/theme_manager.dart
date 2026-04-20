import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager{
  static final ThemeData dark =ThemeData(
    scaffoldBackgroundColor: ColorsManagers.darkNavy,
    shadowColor: ColorsManagers.white,
    primaryColor: ColorsManagers.darkNavy,
    iconTheme: IconThemeData(color: ColorsManagers.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManagers.gray,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManagers.blue,
      unselectedItemColor: ColorsManagers.white.withOpacity(.6),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsGeometry.all(14.sp),
        backgroundColor: ColorsManagers.white,
        foregroundColor: ColorsManagers.black,
        textStyle: GoogleFonts.cairo(
          fontSize: 18.sp,
          color: ColorsManagers.black,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20.r),
        ),
      ),
    ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.inter(
          fontSize: 18.sp,
          color: ColorsManagers.white,
          fontWeight: FontWeight.w400,
        ),
        prefixIconColor: ColorsManagers.blue,
        suffixIconColor: ColorsManagers.blue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.red),
        ),
      ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.cairo(
        fontSize: 16.sp,
        color: ColorsManagers.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.tajawal(
        fontSize: 24.sp,
        color: ColorsManagers.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cairo(
        fontSize: 32.sp,
        color: ColorsManagers.white,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManagers.white,
      ),
    )
  );
  static final ThemeData light =ThemeData(
      scaffoldBackgroundColor: ColorsManagers.white,
      shadowColor: ColorsManagers.black,
      primaryColor: ColorsManagers.white,
      iconTheme: IconThemeData(color: ColorsManagers.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManagers.red,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManagers.blue,
        unselectedItemColor: ColorsManagers.white.withOpacity(.6),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsetsGeometry.all(14.sp),
          backgroundColor: ColorsManagers.white,
          foregroundColor: ColorsManagers.black,
          textStyle: GoogleFonts.cairo(
            fontSize: 18.sp,
            color: ColorsManagers.black,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20.r),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.inter(
          fontSize: 18.sp,
          color: ColorsManagers.black,
          fontWeight: FontWeight.w400,
        ),
        prefixIconColor: ColorsManagers.blue,
        suffixIconColor: ColorsManagers.blue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorsManagers.red),
        ),
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.cairo(
          fontSize: 16.sp,
          color: ColorsManagers.black,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.tajawal(
          fontSize: 24.sp,
          color: ColorsManagers.black,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.cairo(
          fontSize: 32.sp,
          color: ColorsManagers.black,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManagers.black,
        ),
      )
  );
}
