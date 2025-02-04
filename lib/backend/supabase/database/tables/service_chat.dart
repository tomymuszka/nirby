import '../database.dart';

class ServiceChatTable extends SupabaseTable<ServiceChatRow> {
  @override
  String get tableName => 'service_chat';

  @override
  ServiceChatRow createRow(Map<String, dynamic> data) => ServiceChatRow(data);
}

class ServiceChatRow extends SupabaseDataRow {
  ServiceChatRow(super.data);

  @override
  SupabaseTable get table => ServiceChatTable();

  String? get professionalNombre => getField<String>('professional_nombre');
  set professionalNombre(String? value) =>
      setField<String>('professional_nombre', value);

  String? get professionalApellido => getField<String>('professional_apellido');
  set professionalApellido(String? value) =>
      setField<String>('professional_apellido', value);

  String? get professionalFoto => getField<String>('professional_foto');
  set professionalFoto(String? value) =>
      setField<String>('professional_foto', value);

  String? get serviceTitle => getField<String>('service_title');
  set serviceTitle(String? value) => setField<String>('service_title', value);

  String? get servicePrecio => getField<String>('service_precio');
  set servicePrecio(String? value) => setField<String>('service_precio', value);

  int? get serviceId => getField<int>('service_id');
  set serviceId(int? value) => setField<int>('service_id', value);
}
