import '../database.dart';

class ChatsFilteredTable extends SupabaseTable<ChatsFilteredRow> {
  @override
  String get tableName => 'chats_filtered';

  @override
  ChatsFilteredRow createRow(Map<String, dynamic> data) =>
      ChatsFilteredRow(data);
}

class ChatsFilteredRow extends SupabaseDataRow {
  ChatsFilteredRow(super.data);

  @override
  SupabaseTable get table => ChatsFilteredTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  String? get recipentId => getField<String>('recipent_id');
  set recipentId(String? value) => setField<String>('recipent_id', value);

  int? get conversationId => getField<int>('conversation_id');
  set conversationId(int? value) => setField<int>('conversation_id', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);

  bool? get visto => getField<bool>('visto');
  set visto(bool? value) => setField<bool>('visto', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);
}
