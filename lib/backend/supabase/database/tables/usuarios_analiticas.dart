import '../database.dart';

class UsuariosAnaliticasTable extends SupabaseTable<UsuariosAnaliticasRow> {
  @override
  String get tableName => 'usuarios_analiticas';

  @override
  UsuariosAnaliticasRow createRow(Map<String, dynamic> data) =>
      UsuariosAnaliticasRow(data);
}

class UsuariosAnaliticasRow extends SupabaseDataRow {
  UsuariosAnaliticasRow(super.data);

  @override
  SupabaseTable get table => UsuariosAnaliticasTable();

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  bool? get enVerificacion => getField<bool>('en_verificacion');
  set enVerificacion(bool? value) => setField<bool>('en_verificacion', value);

  DateTime? get fechaNacimiento => getField<DateTime>('fecha_nacimiento');
  set fechaNacimiento(DateTime? value) =>
      setField<DateTime>('fecha_nacimiento', value);

  String? get documento => getField<String>('documento');
  set documento(String? value) => setField<String>('documento', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  String? get telefono => getField<String>('telefono');
  set telefono(String? value) => setField<String>('telefono', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get paisResidencia => getField<String>('pais_residencia');
  set paisResidencia(String? value) =>
      setField<String>('pais_residencia', value);

  DateTime? get fechaCreacionSuscripcion =>
      getField<DateTime>('fecha_creacion_suscripcion');
  set fechaCreacionSuscripcion(DateTime? value) =>
      setField<DateTime>('fecha_creacion_suscripcion', value);

  int? get totalAlertasCreadas => getField<int>('total_alertas_creadas');
  set totalAlertasCreadas(int? value) =>
      setField<int>('total_alertas_creadas', value);

  int? get totalConversaciones => getField<int>('total_conversaciones');
  set totalConversaciones(int? value) =>
      setField<int>('total_conversaciones', value);

  int? get totalConversacionesPorAlertas =>
      getField<int>('total_conversaciones_por_alertas');
  set totalConversacionesPorAlertas(int? value) =>
      setField<int>('total_conversaciones_por_alertas', value);

  int? get totalConversacionesSinAlertas =>
      getField<int>('total_conversaciones_sin_alertas');
  set totalConversacionesSinAlertas(int? value) =>
      setField<int>('total_conversaciones_sin_alertas', value);

  int? get totalServicios => getField<int>('total_servicios');
  set totalServicios(int? value) => setField<int>('total_servicios', value);

  int? get totalServiciosActivos => getField<int>('total_servicios_activos');
  set totalServiciosActivos(int? value) =>
      setField<int>('total_servicios_activos', value);

  int? get totalServiciosInactivos =>
      getField<int>('total_servicios_inactivos');
  set totalServiciosInactivos(int? value) =>
      setField<int>('total_servicios_inactivos', value);

  int? get totalAlertasServicioSeleccionadas =>
      getField<int>('total_alertas_servicio_seleccionadas');
  set totalAlertasServicioSeleccionadas(int? value) =>
      setField<int>('total_alertas_servicio_seleccionadas', value);

  int? get totalAlertasConInteres => getField<int>('total_alertas_con_interes');
  set totalAlertasConInteres(int? value) =>
      setField<int>('total_alertas_con_interes', value);

  int? get totalAlertasConversacionIniciada =>
      getField<int>('total_alertas_conversacion_iniciada');
  set totalAlertasConversacionIniciada(int? value) =>
      setField<int>('total_alertas_conversacion_iniciada', value);

  int? get totalAlertasDescartadas =>
      getField<int>('total_alertas_descartadas');
  set totalAlertasDescartadas(int? value) =>
      setField<int>('total_alertas_descartadas', value);
}
