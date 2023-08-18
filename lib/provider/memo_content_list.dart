import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoContentsNotifier extends StateNotifier<List<String>> {
  MemoContentsNotifier() : super([]);

  void addMemo(String memo) {
    state = [...state, memo];
  }
  // TODO: "removeTodo" のような他のメソッドを追加する
}

// TODO: ID採番されるようになったらfamily使って操作できるようにするのもあり？
final memoContentsProvider =
    StateNotifierProvider.autoDispose<MemoContentsNotifier, List<String>>(
        (ref) {
  return MemoContentsNotifier();
});
