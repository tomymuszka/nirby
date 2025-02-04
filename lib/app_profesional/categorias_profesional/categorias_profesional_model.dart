import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'categorias_profesional_widget.dart' show CategoriasProfesionalWidget;
import 'package:flutter/material.dart';

class CategoriasProfesionalModel
    extends FlutterFlowModel<CategoriasProfesionalWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CategoriasRow>? categorias;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
