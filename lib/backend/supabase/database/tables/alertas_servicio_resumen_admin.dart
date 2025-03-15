import '../database.dart';

class AlertasServicioResumenAdminTable
    extends SupabaseTable<AlertasServicioResumenAdminRow> {
  @override
  String get tableName => 'alertas_servicio_resumen_admin';

  @override
  AlertasServicioResumenAdminRow createRow(Map<String, dynamic> data) =>
      AlertasServicioResumenAdminRow(data);
}

class AlertasServicioResumenAdminRow extends SupabaseDataRow {
  AlertasServicioResumenAdminRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlertasServicioResumenAdminTable();

  int? get alertaId => getField<int>('alerta_id');
  set alertaId(int? value) => setField<int>('alerta_id', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  int? get totalProfesionalesRecibieron =>
      getField<int>('total_profesionales_recibieron');
  set totalProfesionalesRecibieron(int? value) =>
      setField<int>('total_profesionales_recibieron', value);

  int? get totalInteresados => getField<int>('total_interesados');
  set totalInteresados(int? value) => setField<int>('total_interesados', value);

  int? get totalDescartados => getField<int>('total_descartados');
  set totalDescartados(int? value) => setField<int>('total_descartados', value);

  int? get totalConversaciones => getField<int>('total_conversaciones');
  set totalConversaciones(int? value) =>
      setField<int>('total_conversaciones', value);

  String? get userEmitedNombre => getField<String>('user_emited_nombre');
  set userEmitedNombre(String? value) =>
      setField<String>('user_emited_nombre', value);

  String? get userEmitedApellido => getField<String>('user_emited_apellido');
  set userEmitedApellido(String? value) =>
      setField<String>('user_emited_apellido', value);

  String? get userEmitedFoto => getField<String>('user_emited_foto');
  set userEmitedFoto(String? value) =>
      setField<String>('user_emited_foto', value);
}
