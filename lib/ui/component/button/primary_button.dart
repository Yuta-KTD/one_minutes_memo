import 'package:flutter/material.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SimpleText(text: text),
    );
  }
}
