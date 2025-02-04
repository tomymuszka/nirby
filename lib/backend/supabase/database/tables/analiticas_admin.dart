import '../database.dart';

class AnaliticasAdminTable extends SupabaseTable<AnaliticasAdminRow> {
  @override
  String get tableName => 'analiticas_admin';

  @override
  AnaliticasAdminRow createRow(Map<String, dynamic> data) =>
      AnaliticasAdminRow(data);
}

class AnaliticasAdminRow extends SupabaseDataRow {
  AnaliticasAdminRow(super.data);

  @override
  SupabaseTable get table => AnaliticasAdminTable();

  int? get totalServiciosActivos => getField<int>('total_servicios_activos');
  set totalServiciosActivos(int? value) =>
      setField<int>('total_servicios_activos', value);

  int? get totalConversacionesIniciadas =>
      getField<int>('total_conversaciones_iniciadas');
  set totalConversacionesIniciadas(int? value) =>
      setField<int>('total_conversaciones_iniciadas', value);

  int? get totalUsuariosRegistrados =>
      getField<int>('total_usuarios_registrados');
  set totalUsuariosRegistrados(int? value) =>
      setField<int>('total_usuarios_registrados', value);

  int? get totalUsuariosSuscripcionActiva =>
      getField<int>('total_usuarios_suscripcion_activa');
  set totalUsuariosSuscripcionActiva(int? value) =>
      setField<int>('total_usuarios_suscripcion_activa', value);

  int? get totalUsuariosSuscripcionInactiva =>
      getField<int>('total_usuarios_suscripcion_inactiva');
  set totalUsuariosSuscripcionInactiva(int? value) =>
      setField<int>('total_usuarios_suscripcion_inactiva', value);
}
