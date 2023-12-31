import 'package:flutter/material.dart';
import 'package:one_minutes_memo/view/component/button/primary_button.dart';
import 'package:one_minutes_memo/view/component/simple_text.dart';

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
      child: isLoading
          ? const SizedBox(
              width: 10.0,
              height: 10.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : SimpleText(text),
    );
  }
}
