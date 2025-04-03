import '../database.dart';

class ProfessionalDetailsTable extends SupabaseTable<ProfessionalDetailsRow> {
  @override
  String get tableName => 'professional_details';

  @override
  ProfessionalDetailsRow createRow(Map<String, dynamic> data) =>
      ProfessionalDetailsRow(data);
}

class ProfessionalDetailsRow extends SupabaseDataRow {
  ProfessionalDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfessionalDetailsTable();

  String? get professionalId => getField<String>('professional_id');
  set professionalId(String? value) =>
      setField<String>('professional_id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  int? get totalConversations => getField<int>('total_conversations');
  set totalConversations(int? value) =>
      setField<int>('total_conversations', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  int? get bestReviewStars => getField<int>('best_review_stars');
  set bestReviewStars(int? value) => setField<int>('best_review_stars', value);

  String? get bestReviewComment => getField<String>('best_review_comment');
  set bestReviewComment(String? value) =>
      setField<String>('best_review_comment', value);

  String? get bestReviewClientNombre =>
      getField<String>('best_review_client_nombre');
  set bestReviewClientNombre(String? value) =>
      setField<String>('best_review_client_nombre', value);

  String? get bestReviewClientApellido =>
      getField<String>('best_review_client_apellido');
  set bestReviewClientApellido(String? value) =>
      setField<String>('best_review_client_apellido', value);

  String? get bestReviewClientFoto =>
      getField<String>('best_review_client_foto');
  set bestReviewClientFoto(String? value) =>
      setField<String>('best_review_client_foto', value);
}
