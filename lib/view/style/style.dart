// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xff5A73D8);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const darkBgcolorOfApp = Color(0xff171725);
  static const lightBgcolorOfApp = Color(0xffFAFAFD);
  static const greyColor65 = Color(0xffF2F2F3);
  static const greyColor90 = Color(0xff95969D);
  static const navBgcolorOfApp = Color(0xff121421);
  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff2641c2),
        Color(0xff01BBFFD),
      ]);

  static const linearGradientGreen = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xffFAFD8F),
        Color(0xff01BBFFD),
      ]);

  static const linearUserInfo = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff6782B4),
        Color(0xffB1BFD8),
      ]);

  static const linearUser = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 50, 63, 88),
        Color.fromARGB(255, 37, 97, 199),
      ]);

  static const primaryDisabledColor = Color.fromARGB(255, 132, 250, 193);

  static textStyleRegular({
    double size = 18,
    Color textColor = blackColor,
  }) =>
      GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: textColor, fontSize: size);

  static textStyleRegular2({
    double size = 16,
    Color textColor = blackColor,
  }) =>
      GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: textColor, fontSize: size);
}
