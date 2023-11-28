import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/model/memo.dart';
import 'package:one_minutes_memo/provider/memo_content_list_provider.dart';
import 'package:one_minutes_memo/provider/memo_title_provider.dart';
import 'package:one_minutes_memo/repository/add_memo_repository.dart';

// AsuncNotifireがマウントされたかを確認する方法は現在確立されていないので、代わりにStateNotifireを使用しています
// 参考: https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
class AddMemoAsyncNotifier extends StateNotifier<AsyncValue<void>> {
  AddMemoAsyncNotifier(this.ref) : super(const AsyncValue.loading());
  final Ref ref;

  Future<void> addMemo() async {
    final String memoTitle = ref.read(memoTitleProvier) ?? 'タイトルなし';
    final List<String?> memoContent =
        ref.read(memoContentsNotifireProvider) ?? [];
    final Memo memo = Memo(title: memoTitle, contents: memoContent);
    final addMemoRepository = ref.read(addMemoRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () async => await addMemoRepository.addMemo(memo));
  }
}

final addMemoAsyncNotifierProvider =
    StateNotifierProvider<AddMemoAsyncNotifier, AsyncValue<void>>(
        (ref) => AddMemoAsyncNotifier(ref));
