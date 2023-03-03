import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  ClickableText({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
