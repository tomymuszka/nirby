import '../database.dart';

class UsuariosAlertasTable extends SupabaseTable<UsuariosAlertasRow> {
  @override
  String get tableName => 'usuarios_alertas';

  @override
  UsuariosAlertasRow createRow(Map<String, dynamic> data) =>
      UsuariosAlertasRow(data);
}

class UsuariosAlertasRow extends SupabaseDataRow {
  UsuariosAlertasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosAlertasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get alertaId => getField<int>('alerta_id')!;
  set alertaId(int value) => setField<int>('alerta_id', value);

  String get profesionalInteresado =>
      getField<String>('profesional_interesado')!;
  set profesionalInteresado(String value) =>
      setField<String>('profesional_interesado', value);

  bool? get profesionalInterested => getField<bool>('profesional_interested');
  set profesionalInterested(bool? value) =>
      setField<bool>('profesional_interested', value);

  bool? get userDescartedProfesional =>
      getField<bool>('user_descarted_profesional');
  set userDescartedProfesional(bool? value) =>
      setField<bool>('user_descarted_profesional', value);
}
