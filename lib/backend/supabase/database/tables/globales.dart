import '../database.dart';

class GlobalesTable extends SupabaseTable<GlobalesRow> {
  @override
  String get tableName => 'globales';

  @override
  GlobalesRow createRow(Map<String, dynamic> data) => GlobalesRow(data);
}

class GlobalesRow extends SupabaseDataRow {
  GlobalesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GlobalesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double get suscripcionMensual => getField<double>('suscripcion_mensual')!;
  set suscripcionMensual(double value) =>
      setField<double>('suscripcion_mensual', value);

  double get suscripcionAnual => getField<double>('suscripcion_anual')!;
  set suscripcionAnual(double value) =>
      setField<double>('suscripcion_anual', value);
}
