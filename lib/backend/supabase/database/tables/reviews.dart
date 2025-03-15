import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get estrellas => getField<int>('estrellas');
  set estrellas(int? value) => setField<int>('estrellas', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String get userClient => getField<String>('user_client')!;
  set userClient(String value) => setField<String>('user_client', value);

  String get userProfesional => getField<String>('user_profesional')!;
  set userProfesional(String value) =>
      setField<String>('user_profesional', value);

  int? get conversationId => getField<int>('conversation_id');
  set conversationId(int? value) => setField<int>('conversation_id', value);

  bool? get contrato => getField<bool>('contrato');
  set contrato(bool? value) => setField<bool>('contrato', value);
}
