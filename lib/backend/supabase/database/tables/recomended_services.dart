import '../database.dart';

class RecomendedServicesTable extends SupabaseTable<RecomendedServicesRow> {
  @override
  String get tableName => 'recomended_services';

  @override
  RecomendedServicesRow createRow(Map<String, dynamic> data) =>
      RecomendedServicesRow(data);
}

class RecomendedServicesRow extends SupabaseDataRow {
  RecomendedServicesRow(super.data);

  @override
  SupabaseTable get table => RecomendedServicesTable();

  int? get serviceId => getField<int>('service_id');
  set serviceId(int? value) => setField<int>('service_id', value);

  String? get serviceTitle => getField<String>('service_title');
  set serviceTitle(String? value) => setField<String>('service_title', value);

  List<String> get coverageAreas => getListField<String>('coverage_areas');
  set coverageAreas(List<String>? value) =>
      setListField<String>('coverage_areas', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  String? get professionalFoto => getField<String>('professional_foto');
  set professionalFoto(String? value) =>
      setField<String>('professional_foto', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);
}
