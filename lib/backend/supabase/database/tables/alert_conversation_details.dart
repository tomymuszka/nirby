import '../database.dart';

class AlertConversationDetailsTable
    extends SupabaseTable<AlertConversationDetailsRow> {
  @override
  String get tableName => 'alert_conversation_details';

  @override
  AlertConversationDetailsRow createRow(Map<String, dynamic> data) =>
      AlertConversationDetailsRow(data);
}

class AlertConversationDetailsRow extends SupabaseDataRow {
  AlertConversationDetailsRow(super.data);

  @override
  SupabaseTable get table => AlertConversationDetailsTable();

  int? get conversationId => getField<int>('conversation_id');
  set conversationId(int? value) => setField<int>('conversation_id', value);

  int? get alertaDeServicio => getField<int>('alerta_de_servicio');
  set alertaDeServicio(int? value) =>
      setField<int>('alerta_de_servicio', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);

  String? get alertaDescription => getField<String>('alerta_description');
  set alertaDescription(String? value) =>
      setField<String>('alerta_description', value);

  int? get alertaCategory => getField<int>('alerta_category');
  set alertaCategory(int? value) => setField<int>('alerta_category', value);

  DateTime? get alertaDateComplete =>
      getField<DateTime>('alerta_date_complete');
  set alertaDateComplete(DateTime? value) =>
      setField<DateTime>('alerta_date_complete', value);

  String? get alertaArea => getField<String>('alerta_area');
  set alertaArea(String? value) => setField<String>('alerta_area', value);

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
