## users Collection

| Field        | Type        | Description                                      |
|--------------|-------------|--------------------------------------------------|
| user_id      | Document ID | Firebase AuthenticationによるユーザーID           |
| email        | String      | ユーザーのメールアドレス                           |
| display_name | String      | ユーザーの表示名                                   |
| ...          | ...         | その他のユーザー関連のフィールド                    |

---

## memos Collection

| Field     | Type            | Description                                      |
|-----------|-----------------|--------------------------------------------------|
| memo_id   | Document ID     | メモのユニークID                                   |
| user_id   | Reference       | メモ作成者のユーザーIDの参照                        |
| title     | String          | メモのタイトル                                     |
| content   | String          | メモの内容                                         |
| timestamp | Timestamp       | メモの作成日時                                     |
| image     | URL/Reference   | 画像のURLやFirebase Storageへの参照（ある場合）     |
| shared    | Boolean         | メモが共有されているかのフラグ（true or false）     |

---

## shared_memos Collection (オプショナル)

| Field     | Type          | Description                                      |
|-----------|---------------|--------------------------------------------------|
| memo_id   | Document ID   | メモのユニークID                                   |
| user_id   | Reference     | メモ作成者のユーザーIDの参照                        |
| title     | String        | メモのタイトル                                     |
| content   | String        | メモの内容                                         |
| timestamp | Timestamp     | メモの作成日時                                     |
| image     | URL/Reference | 画像のURLやFirebase Storageへの参照（ある場合）     |
