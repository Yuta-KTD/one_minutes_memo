import 'package:flutter/material.dart';
import 'package:one_minutes_memo/ui/component/button/primary_button.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';

class LoadingButton extends PrimaryButton {
  const LoadingButton(
      {super.key,
      required this.isLoading,
      required super.onPressed,
      required super.text});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading ? const CircularProgressIndicator() : SimpleText(text),
    );
  }
}
