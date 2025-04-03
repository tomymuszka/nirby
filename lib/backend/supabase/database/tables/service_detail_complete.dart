import '../database.dart';

class ServiceDetailCompleteTable
    extends SupabaseTable<ServiceDetailCompleteRow> {
  @override
  String get tableName => 'service_detail_complete';

  @override
  ServiceDetailCompleteRow createRow(Map<String, dynamic> data) =>
      ServiceDetailCompleteRow(data);
}

class ServiceDetailCompleteRow extends SupabaseDataRow {
  ServiceDetailCompleteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceDetailCompleteTable();

  int? get serviceId => getField<int>('service_id');
  set serviceId(int? value) => setField<int>('service_id', value);

  String? get serviceTitle => getField<String>('service_title');
  set serviceTitle(String? value) => setField<String>('service_title', value);

  String? get professionalTitle => getField<String>('professional_title');
  set professionalTitle(String? value) =>
      setField<String>('professional_title', value);

  List<String> get coverageAreas => getListField<String>('coverage_areas');
  set coverageAreas(List<String>? value) =>
      setListField<String>('coverage_areas', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get professionalFoto => getField<String>('professional_foto');
  set professionalFoto(String? value) =>
      setField<String>('professional_foto', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  String? get professionalId => getField<String>('professional_id');
  set professionalId(String? value) =>
      setField<String>('professional_id', value);

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

  int? get totalConversations => getField<int>('total_conversations');
  set totalConversations(int? value) =>
      setField<int>('total_conversations', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  bool? get atiendenUrgencias => getField<bool>('atienden_urgencias');
  set atiendenUrgencias(bool? value) =>
      setField<bool>('atienden_urgencias', value);

  List<String> get budgetNoCharge => getListField<String>('budget_no_charge');
  set budgetNoCharge(List<String>? value) =>
      setListField<String>('budget_no_charge', value);
}
