import '../database.dart';

class InterestedProfessionalsTable
    extends SupabaseTable<InterestedProfessionalsRow> {
  @override
  String get tableName => 'interested_professionals';

  @override
  InterestedProfessionalsRow createRow(Map<String, dynamic> data) =>
      InterestedProfessionalsRow(data);
}

class InterestedProfessionalsRow extends SupabaseDataRow {
  InterestedProfessionalsRow(super.data);

  @override
  SupabaseTable get table => InterestedProfessionalsTable();

  String? get profesionalId => getField<String>('profesional_id');
  set profesionalId(String? value) => setField<String>('profesional_id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get professionalTitle => getField<String>('professional_title');
  set professionalTitle(String? value) =>
      setField<String>('professional_title', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  int? get alertaId => getField<int>('alerta_id');
  set alertaId(int? value) => setField<int>('alerta_id', value);

  int? get category => getField<int>('category');
  set category(int? value) => setField<int>('category', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);
}
