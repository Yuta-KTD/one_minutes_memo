import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  const SimpleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
