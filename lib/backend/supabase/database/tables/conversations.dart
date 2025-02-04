import '../database.dart';

class ConversationsTable extends SupabaseTable<ConversationsRow> {
  @override
  String get tableName => 'conversations';

  @override
  ConversationsRow createRow(Map<String, dynamic> data) =>
      ConversationsRow(data);
}

class ConversationsRow extends SupabaseDataRow {
  ConversationsRow(super.data);

  @override
  SupabaseTable get table => ConversationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get buyerId => getField<String>('buyer_id')!;
  set buyerId(String value) => setField<String>('buyer_id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);

  List<String> get conversationMembers =>
      getListField<String>('conversation_members');
  set conversationMembers(List<String> value) =>
      setListField<String>('conversation_members', value);

  int? get servicio => getField<int>('servicio');
  set servicio(int? value) => setField<int>('servicio', value);

  bool get isDeleted => getField<bool>('is_deleted')!;
  set isDeleted(bool value) => setField<bool>('is_deleted', value);

  int? get alertaDeServicio => getField<int>('alerta_de_servicio');
  set alertaDeServicio(int? value) =>
      setField<int>('alerta_de_servicio', value);
}
