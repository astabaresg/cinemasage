import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.getTextTheme('Poppins'),
      colorSchemeSeed: const Color(0xFF002642));
}
