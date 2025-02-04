import '../database.dart';

class ServiceDetailsTable extends SupabaseTable<ServiceDetailsRow> {
  @override
  String get tableName => 'service_details';

  @override
  ServiceDetailsRow createRow(Map<String, dynamic> data) =>
      ServiceDetailsRow(data);
}

class ServiceDetailsRow extends SupabaseDataRow {
  ServiceDetailsRow(super.data);

  @override
  SupabaseTable get table => ServiceDetailsTable();

  int? get serviceId => getField<int>('service_id');
  set serviceId(int? value) => setField<int>('service_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  List<String> get coverageAreas => getListField<String>('coverage_areas');
  set coverageAreas(List<String>? value) =>
      setListField<String>('coverage_areas', value);

  List<int> get categoria => getListField<int>('categoria');
  set categoria(List<int>? value) => setListField<int>('categoria', value);

  String? get professionalFoto => getField<String>('professional_foto');
  set professionalFoto(String? value) =>
      setField<String>('professional_foto', value);

  String? get professionalTitulo => getField<String>('professional_titulo');
  set professionalTitulo(String? value) =>
      setField<String>('professional_titulo', value);

  bool? get suscripcionActiva => getField<bool>('suscripcion_activa');
  set suscripcionActiva(bool? value) =>
      setField<bool>('suscripcion_activa', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get anosexperiencia => getField<int>('anosexperiencia');
  set anosexperiencia(int? value) => setField<int>('anosexperiencia', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  String? get professionalId => getField<String>('professional_id');
  set professionalId(String? value) =>
      setField<String>('professional_id', value);

  List<String> get budgetNoCharge => getListField<String>('budget_no_charge');
  set budgetNoCharge(List<String>? value) =>
      setListField<String>('budget_no_charge', value);
}
