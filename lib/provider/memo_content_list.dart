import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoContentsNotifier extends StateNotifier<List<String>> {
  MemoContentsNotifier() : super([]);

  void addMemo(String memo) {
    state = [...state, memo];
    print(state);
  }
  // TODO: "removeTodo" のような他のメソッドを追加する
}

final memoContentsProvider =
    StateNotifierProvider<MemoContentsNotifier, List<String>>((ref) {
  return MemoContentsNotifier();
});
