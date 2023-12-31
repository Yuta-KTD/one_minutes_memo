import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:one_minutes_memo/provider/memo_title_provider.dart';
import 'package:one_minutes_memo/repository/auth_repository.dart';
import 'package:one_minutes_memo/router/router.dart';
import 'package:one_minutes_memo/view/component/button/primary_button.dart';
import 'package:one_minutes_memo/view/component/form/primary_text_field.dart';
import 'package:one_minutes_memo/view/component/simple_text.dart';

class TitleScreen extends ConsumerWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: const SimpleText("今回のテーマ"),
        actions: [
          IconButton(
            onPressed: () => ref.read(authRepositoryProvider).signOut(),
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: FormBuilder(
          key: formKey,
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
                onPressed: () => _onPressed(ref, context, formKey),
                text: "メモを追加",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(
    WidgetRef ref,
    BuildContext context,
    GlobalKey<FormBuilderState> formKey,
  ) {
    if (!formKey.currentState!.saveAndValidate()) {
      return;
    }
    final String title = formKey.currentState!.value["title"];
    ref.watch(memoTitleProvier.notifier).state = title;
    const AddMemoRoute().go(context);
  }
}
