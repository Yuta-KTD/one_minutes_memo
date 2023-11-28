import 'package:one_minutes_memo/model/memo.dart';

abstract class AddMemoRepositoryInterface {
  // NOTE: 今後、メモの構造が変わる可能性あり
  Future<void> addMemo(Memo memo);
}
