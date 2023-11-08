import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memo_content_list_provider.g.dart';

@riverpod
class MemoContentsNotifire extends _$MemoContentsNotifire {
  @override
  List<String?> build() => [];

  void addMemo(String memo) {
    state = [...state, memo];
  }
}
