import 'package:flutter/material.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SimpleText(title),
    );
  }
}
