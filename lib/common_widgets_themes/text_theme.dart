import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemedText extends StatelessWidget {
  const ThemedText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.teko(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
