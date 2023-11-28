import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// TimestampとDateTimeの相互変換を行う
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp? json) {
    if (json == null) {
      return DateTime.now();
    }
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime? object) => object == null
      ? Timestamp.fromDate(DateTime.now())
      : Timestamp.fromDate(object);
}
