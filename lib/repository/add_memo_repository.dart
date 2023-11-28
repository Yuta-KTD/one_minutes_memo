import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_minutes_memo/model/memo.dart';
import 'package:one_minutes_memo/repository/add_memo_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_memo_repository.g.dart';

class AddMemoRepository implements AddMemoRepositoryInterface {
  AddMemoRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<void> addMemo(Memo memo) async {
    try {
      await _firestore.collection('memos').add(memo.toJson());
    } on FirebaseException catch (e) {
      // if (e.code == Firebase.permissionDenied.receiveCode) {

      // }
      // throw const FirebaseException('メモの追加に失敗しました');
    } catch (e) {
      // throw const FirebaseException('原因不明のエラーが発生しました\n開発者にお問い合わせください');
    }
  }
}

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
AddMemoRepositoryInterface addMemoRepository(AddMemoRepositoryRef ref) =>
    AddMemoRepository(ref.read(firestoreProvider));
