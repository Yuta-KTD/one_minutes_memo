import 'package:flutter/material.dart';
import 'package:one_minutes_memo/view/component/basic_app_bar.dart';

class FormScreenTheme extends StatelessWidget {
  const FormScreenTheme({super.key, required this.children, this.appBar});

  final List<Widget> children;
  final BasicAppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          const BasicAppBar(
            title: '１分間メモ',
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
