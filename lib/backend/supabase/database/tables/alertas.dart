import '../database.dart';

class AlertasTable extends SupabaseTable<AlertasRow> {
  @override
  String get tableName => 'alertas';

  @override
  AlertasRow createRow(Map<String, dynamic> data) => AlertasRow(data);
}

class AlertasRow extends SupabaseDataRow {
  AlertasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlertasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  int get category => getField<int>('category')!;
  set category(int value) => setField<int>('category', value);

  String get area => getField<String>('area')!;
  set area(String value) => setField<String>('area', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String get userEmitedAlert => getField<String>('user_emited_alert')!;
  set userEmitedAlert(String value) =>
      setField<String>('user_emited_alert', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  DateTime? get dateComplete => getField<DateTime>('date_complete');
  set dateComplete(DateTime? value) =>
      setField<DateTime>('date_complete', value);
}
