import '../database.dart';

class UsuarioCategoriasInteresTable
    extends SupabaseTable<UsuarioCategoriasInteresRow> {
  @override
  String get tableName => 'usuario_categorias_interes';

  @override
  UsuarioCategoriasInteresRow createRow(Map<String, dynamic> data) =>
      UsuarioCategoriasInteresRow(data);
}

class UsuarioCategoriasInteresRow extends SupabaseDataRow {
  UsuarioCategoriasInteresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioCategoriasInteresTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<String> get categoriaNombres =>
      getListField<String>('categoria_nombres');
  set categoriaNombres(List<String>? value) =>
      setListField<String>('categoria_nombres', value);
}
