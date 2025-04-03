import '../database.dart';

class ServicesTable extends SupabaseTable<ServicesRow> {
  @override
  String get tableName => 'services';

  @override
  ServicesRow createRow(Map<String, dynamic> data) => ServicesRow(data);
}

class ServicesRow extends SupabaseDataRow {
  ServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get professional => getField<String>('professional')!;
  set professional(String value) => setField<String>('professional', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String get price => getField<String>('price')!;
  set price(String value) => setField<String>('price', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  List<String> get coverageAreas => getListField<String>('coverage_areas');
  set coverageAreas(List<String> value) =>
      setListField<String>('coverage_areas', value);

  List<int> get categoria => getListField<int>('categoria');
  set categoria(List<int>? value) => setListField<int>('categoria', value);

  bool get atiendenUrgencias => getField<bool>('atienden_urgencias')!;
  set atiendenUrgencias(bool value) =>
      setField<bool>('atienden_urgencias', value);

  bool get isDeleted => getField<bool>('is_deleted')!;
  set isDeleted(bool value) => setField<bool>('is_deleted', value);

  List<String> get budgetNoCharge => getListField<String>('budget_no_charge');
  set budgetNoCharge(List<String>? value) =>
      setListField<String>('budget_no_charge', value);
}
