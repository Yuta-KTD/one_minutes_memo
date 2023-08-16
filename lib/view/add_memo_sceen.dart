import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:one_minutes_memo/provider/memo_content_list.dart';

import '../constant/text_const.dart';
import '../ui/component/button/primary_button.dart';
import '../ui/component/form/primary_text_field.dart';
import '../ui/component/simple_text.dart';

class AddMemoScreen extends ConsumerStatefulWidget {
  const AddMemoScreen({super.key});

  @override
  AddMemoScreenState createState() => AddMemoScreenState();
}

class AddMemoScreenState extends ConsumerState<AddMemoScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(text: TextConst.memoTitle),
      ),
      body: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PrimaryTextField(
                    name: "memo",
                    labelText: "本文",
                    isMultiLineInput: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: '最低1文字は入力が必要です',
                      )
                    ]),
                  ),
                ),
                PrimaryButton(
                  onPressed: () => _onPressed(),
                  text: "メモを追加",
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Card(
                  elevation: 4,
                  child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Center(child: Text('登録メモ'))),
                ),
                // パフォーマンス的にやめた方が良さそう
                // TODO: https://www.youtube.com/watch?v=LUqDNnv_dh0 のようにCustomScrollView/Sliver使う
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Text('Sample 1'),
                    Text('Sample 2'),
                    Text('Sample 3'),
                    Text('Sample 4'),
                    Text('Sample 5'),
                    Text('Sample 6'),
                    Text('Sample 7'),
                    Text('Sample 8'),
                    Text('Sample 9'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('データを送信')),
    );
    ref
        .watch(memoContentsProvider.notifier)
        .addMemo(_formKey.currentState!.value["memo"]);

    _formKey.currentState!.patchValue({'memo': ''});
  }
}
