import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(super.data);

  @override
  SupabaseTable get table => UsuariosTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get apellido => getField<String>('apellido')!;
  set apellido(String value) => setField<String>('apellido', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get telefono => getField<String>('telefono');
  set telefono(String? value) => setField<String>('telefono', value);

  String get documento => getField<String>('documento')!;
  set documento(String value) => setField<String>('documento', value);

  String get paisResidencia => getField<String>('pais_residencia')!;
  set paisResidencia(String value) =>
      setField<String>('pais_residencia', value);

  DateTime? get fechaNacimiento => getField<DateTime>('fecha_nacimiento');
  set fechaNacimiento(DateTime? value) =>
      setField<DateTime>('fecha_nacimiento', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  List<int> get interestedCategories =>
      getListField<int>('interested_categories');
  set interestedCategories(List<int>? value) =>
      setListField<int>('interested_categories', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  bool? get enVerificacion => getField<bool>('en_verificacion');
  set enVerificacion(bool? value) => setField<bool>('en_verificacion', value);

  bool? get admin => getField<bool>('admin');
  set admin(bool? value) => setField<bool>('admin', value);

  String? get dniFile => getField<String>('dni_file');
  set dniFile(String? value) => setField<String>('dni_file', value);

  String? get fotoPersonalFile => getField<String>('foto_personal_file');
  set fotoPersonalFile(String? value) =>
      setField<String>('foto_personal_file', value);

  String? get dniFileDorso => getField<String>('dni_file_dorso');
  set dniFileDorso(String? value) => setField<String>('dni_file_dorso', value);

  String? get idsuscripcion => getField<String>('idsuscripcion');
  set idsuscripcion(String? value) => setField<String>('idsuscripcion', value);

  String? get playerId => getField<String>('player_id');
  set playerId(String? value) => setField<String>('player_id', value);

  bool get isDeleted => getField<bool>('is_deleted')!;
  set isDeleted(bool value) => setField<bool>('is_deleted', value);

  DateTime? get fechaCreacionSuscripcion =>
      getField<DateTime>('fecha_creacion_suscripcion');
  set fechaCreacionSuscripcion(DateTime? value) =>
      setField<DateTime>('fecha_creacion_suscripcion', value);

  bool? get seSuscribioAntes => getField<bool>('se_suscribio_antes');
  set seSuscribioAntes(bool? value) =>
      setField<bool>('se_suscribio_antes', value);

  bool? get emailconfirmado => getField<bool>('emailconfirmado');
  set emailconfirmado(bool? value) => setField<bool>('emailconfirmado', value);

  String? get emailMercadopago => getField<String>('email_mercadopago');
  set emailMercadopago(String? value) =>
      setField<String>('email_mercadopago', value);
}
