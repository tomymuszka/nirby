import '../database.dart';

class ConversationDetailsTable extends SupabaseTable<ConversationDetailsRow> {
  @override
  String get tableName => 'conversation_details';

  @override
  ConversationDetailsRow createRow(Map<String, dynamic> data) =>
      ConversationDetailsRow(data);
}

class ConversationDetailsRow extends SupabaseDataRow {
  ConversationDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversationDetailsTable();

  int? get conversationId => getField<int>('conversation_id');
  set conversationId(int? value) => setField<int>('conversation_id', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);

  int? get serviceId => getField<int>('service_id');
  set serviceId(int? value) => setField<int>('service_id', value);

  String? get serviceTitle => getField<String>('service_title');
  set serviceTitle(String? value) => setField<String>('service_title', value);

  String? get buyerId => getField<String>('buyer_id');
  set buyerId(String? value) => setField<String>('buyer_id', value);

  String? get buyerNombre => getField<String>('buyer_nombre');
  set buyerNombre(String? value) => setField<String>('buyer_nombre', value);

  String? get buyerApellido => getField<String>('buyer_apellido');
  set buyerApellido(String? value) => setField<String>('buyer_apellido', value);

  String? get buyerFoto => getField<String>('buyer_foto');
  set buyerFoto(String? value) => setField<String>('buyer_foto', value);

  String? get sellerId => getField<String>('seller_id');
  set sellerId(String? value) => setField<String>('seller_id', value);

  String? get sellerNombre => getField<String>('seller_nombre');
  set sellerNombre(String? value) => setField<String>('seller_nombre', value);

  String? get sellerApellido => getField<String>('seller_apellido');
  set sellerApellido(String? value) =>
      setField<String>('seller_apellido', value);

  String? get sellerFoto => getField<String>('seller_foto');
  set sellerFoto(String? value) => setField<String>('seller_foto', value);
}
