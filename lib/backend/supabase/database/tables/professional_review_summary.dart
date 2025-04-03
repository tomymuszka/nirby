import '../database.dart';

class ProfessionalReviewSummaryTable
    extends SupabaseTable<ProfessionalReviewSummaryRow> {
  @override
  String get tableName => 'professional_review_summary';

  @override
  ProfessionalReviewSummaryRow createRow(Map<String, dynamic> data) =>
      ProfessionalReviewSummaryRow(data);
}

class ProfessionalReviewSummaryRow extends SupabaseDataRow {
  ProfessionalReviewSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfessionalReviewSummaryTable();

  String? get userProfesional => getField<String>('user_profesional');
  set userProfesional(String? value) =>
      setField<String>('user_profesional', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);
}
