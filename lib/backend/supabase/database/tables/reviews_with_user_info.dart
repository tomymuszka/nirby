import '../database.dart';

class ReviewsWithUserInfoTable extends SupabaseTable<ReviewsWithUserInfoRow> {
  @override
  String get tableName => 'reviews_with_user_info';

  @override
  ReviewsWithUserInfoRow createRow(Map<String, dynamic> data) =>
      ReviewsWithUserInfoRow(data);
}

class ReviewsWithUserInfoRow extends SupabaseDataRow {
  ReviewsWithUserInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsWithUserInfoTable();

  String? get userProfesional => getField<String>('user_profesional');
  set userProfesional(String? value) =>
      setField<String>('user_profesional', value);

  int? get estrellas => getField<int>('estrellas');
  set estrellas(int? value) => setField<int>('estrellas', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);
}
