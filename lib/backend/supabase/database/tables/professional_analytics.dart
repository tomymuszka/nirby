import '../database.dart';

class ProfessionalAnalyticsTable
    extends SupabaseTable<ProfessionalAnalyticsRow> {
  @override
  String get tableName => 'professional_analytics';

  @override
  ProfessionalAnalyticsRow createRow(Map<String, dynamic> data) =>
      ProfessionalAnalyticsRow(data);
}

class ProfessionalAnalyticsRow extends SupabaseDataRow {
  ProfessionalAnalyticsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfessionalAnalyticsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get fechaCreacionSuscripcion =>
      getField<DateTime>('fecha_creacion_suscripcion');
  set fechaCreacionSuscripcion(DateTime? value) =>
      setField<DateTime>('fecha_creacion_suscripcion', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  bool? get seSuscribioAntes => getField<bool>('se_suscribio_antes');
  set seSuscribioAntes(bool? value) =>
      setField<bool>('se_suscribio_antes', value);

  int? get activeServicesCount => getField<int>('active_services_count');
  set activeServicesCount(int? value) =>
      setField<int>('active_services_count', value);

  int? get totalConversations => getField<int>('total_conversations');
  set totalConversations(int? value) =>
      setField<int>('total_conversations', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);
}
