import 'package:flutter/material.dart';
import 'package:sneaky_shopper/common_widgets_themes/text_theme.dart';

class ThemedTextButton extends StatelessWidget {
  const ThemedTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: ThemedText(
        color: Colors.white,
        text: text,
        fontSize: 24,
      ),
    );
  }
}
