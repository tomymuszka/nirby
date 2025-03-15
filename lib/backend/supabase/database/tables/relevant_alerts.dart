import '../database.dart';

class RelevantAlertsTable extends SupabaseTable<RelevantAlertsRow> {
  @override
  String get tableName => 'relevant_alerts';

  @override
  RelevantAlertsRow createRow(Map<String, dynamic> data) =>
      RelevantAlertsRow(data);
}

class RelevantAlertsRow extends SupabaseDataRow {
  RelevantAlertsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RelevantAlertsTable();

  int? get alertaId => getField<int>('alerta_id');
  set alertaId(int? value) => setField<int>('alerta_id', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  int? get category => getField<int>('category');
  set category(int? value) => setField<int>('category', value);

  DateTime? get dateComplete => getField<DateTime>('date_complete');
  set dateComplete(DateTime? value) =>
      setField<DateTime>('date_complete', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get userEmitedAlert => getField<String>('user_emited_alert');
  set userEmitedAlert(String? value) =>
      setField<String>('user_emited_alert', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  int? get bestReviewStars => getField<int>('best_review_stars');
  set bestReviewStars(int? value) => setField<int>('best_review_stars', value);

  String? get bestReviewComment => getField<String>('best_review_comment');
  set bestReviewComment(String? value) =>
      setField<String>('best_review_comment', value);

  String? get clientNombre => getField<String>('client_nombre');
  set clientNombre(String? value) => setField<String>('client_nombre', value);

  String? get clientApellido => getField<String>('client_apellido');
  set clientApellido(String? value) =>
      setField<String>('client_apellido', value);

  String? get clientFoto => getField<String>('client_foto');
  set clientFoto(String? value) => setField<String>('client_foto', value);
}
