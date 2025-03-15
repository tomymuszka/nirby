import '../database.dart';

class UnseenMessagesCountTable extends SupabaseTable<UnseenMessagesCountRow> {
  @override
  String get tableName => 'unseen_messages_count';

  @override
  UnseenMessagesCountRow createRow(Map<String, dynamic> data) =>
      UnseenMessagesCountRow(data);
}

class UnseenMessagesCountRow extends SupabaseDataRow {
  UnseenMessagesCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UnseenMessagesCountTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get unseenCount => getField<int>('unseen_count');
  set unseenCount(int? value) => setField<int>('unseen_count', value);
}
