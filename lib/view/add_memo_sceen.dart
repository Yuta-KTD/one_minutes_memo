import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../constant/text_const.dart';
import '../ui/component/button/primary_button.dart';
import '../ui/component/form/primary_text_field.dart';
import '../ui/component/simple_text.dart';

class AddMemoScreen extends StatefulWidget {
  const AddMemoScreen({super.key});

  @override
  State<AddMemoScreen> createState() => _AddMemoScreenState();
}

class _AddMemoScreenState extends State<AddMemoScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _memoError;

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
                    errorText: _memoError,
                    isMultiLineInput: true,
                    validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()],
                    ),
                  ),
                ),
                PrimaryButton(
                  onPressed: () => onPressed(),
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
                      child: Center(child: Text('メモ'))),
                ),
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

  Future<void> onPressed() async {
    setState(() => _memoError = null);
    if (!_formKey.currentState!.validate()) {
      setState(() => _memoError = '最低1文字は入力が必要です');
      return;
    }

    // TODO: API疎通側に移す
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('データを送信')),
    );
    _formKey.currentState?.save();
    print(_formKey.currentState?.value["memo"]);
  }
}
