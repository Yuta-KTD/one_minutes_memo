import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/provider/add_memo_provider.dart';
import 'package:one_minutes_memo/provider/memo_content_list_provider.dart';
import 'package:one_minutes_memo/provider/memo_title_provider.dart';
import 'package:one_minutes_memo/util/dialog/show_platform_alert_dialog.dart';
import 'package:one_minutes_memo/view/component/button/primary_button.dart';
import 'package:one_minutes_memo/view/component/form/primary_text_field.dart';
import 'package:one_minutes_memo/view/component/simple_text.dart';

class AddMemoScreen extends ConsumerStatefulWidget {
  const AddMemoScreen({super.key});

  @override
  AddMemoScreenState createState() => AddMemoScreenState();
}

class AddMemoScreenState extends ConsumerState<AddMemoScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final List<String?> addedMemos = ref.watch(memoContentsNotifireProvider);
    final String? memoTitle = ref.watch(memoTitleProvier);
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: SimpleText("メモの入力(タイトル: ${memoTitle ?? 'なし'})"),
          ),
          bottomNavigationBar: BottomAppBar(
              child: PrimaryButton(
            onPressed: () => _onSessionSubmitted(),
            text: "セクションを終了",
          )),
          body: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: SimpleText(addedMemos[index] ?? 'メモなし'),
                          );
                        },
                        childCount: addedMemos.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return showPlatformAlertDialog(
      context: context,
      title: 'メモを削除しますか？',
      barrierDismissible: true,
      yesCallBack: () => context.pop(true),
      noCallBack: () => context.pop(),
    );
  }

  void _onPressed() {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('メモを追加しました')),
    );
    ref
        .watch(memoContentsNotifireProvider.notifier)
        .addMemo(_formKey.currentState!.value["memo"]);

    _formKey.currentState!.patchValue({'memo': ''});
  }

  Future<void> _onSessionSubmitted() async {
    await ref.read(addMemoAsyncNotifierProvider.notifier).addMemo();
  }
}
