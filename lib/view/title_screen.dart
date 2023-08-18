import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/provider/memo_title_provider.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';

import '../ui/component/button/primary_button.dart';
import '../ui/component/form/primary_text_field.dart';

class TitleScreen extends ConsumerWidget {
  TitleScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText("今回のテーマ"),
      ),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: PrimaryTextField(
                  name: "title",
                  labelText: "テーマ",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: '最低1文字は入力が必要です',
                    )
                  ]),
                ),
              ),
              PrimaryButton(
                onPressed: () => _onPressed(ref, context),
                text: "メモを追加",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(WidgetRef ref, BuildContext context) {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }
    final String title = _formKey.currentState!.value["title"];
    ref.watch(memoTitleProvier.notifier).state = title;
    context.go('/title/addmemo');
  }
}
