import '../database.dart';

class NotificationsUsersTable extends SupabaseTable<NotificationsUsersRow> {
  @override
  String get tableName => 'notifications_users';

  @override
  NotificationsUsersRow createRow(Map<String, dynamic> data) =>
      NotificationsUsersRow(data);
}

class NotificationsUsersRow extends SupabaseDataRow {
  NotificationsUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  bool? get seen => getField<bool>('seen');
  set seen(bool? value) => setField<bool>('seen', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get idAlertaServicio => getField<int>('id_alerta_servicio');
  set idAlertaServicio(int? value) =>
      setField<int>('id_alerta_servicio', value);

  String? get accion => getField<String>('accion');
  set accion(String? value) => setField<String>('accion', value);
}
