import '/app_cliente/home/categoriaindividual/categoriaindividual_widget.dart';
import '/app_cliente/home/profesionalesrecomendados/profesionalesrecomendados_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_component_widget.dart' show HomeComponentWidget;
import 'package:flutter/material.dart';

class HomeComponentModel extends FlutterFlowModel<HomeComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for buscarprofeisonal widget.
  final buscarprofeisonalKey = GlobalKey();
  FocusNode? buscarprofeisonalFocusNode;
  TextEditingController? buscarprofeisonalTextController;
  String? buscarprofeisonalSelectedOption;
  String? Function(BuildContext, String?)?
      buscarprofeisonalTextControllerValidator;
  // Stores action output result for [Backend Call - API (buscarservicio)] action in IconButton widget.
  ApiCallResponse? servicioselected;
  // Models for categoriaindividual dynamic component.
  late FlutterFlowDynamicModels<CategoriaindividualModel>
      categoriaindividualModels;
  // Models for profesionalesrecomendados dynamic component.
  late FlutterFlowDynamicModels<ProfesionalesrecomendadosModel>
      profesionalesrecomendadosModels1;
  // Models for profesionalesrecomendados dynamic component.
  late FlutterFlowDynamicModels<ProfesionalesrecomendadosModel>
      profesionalesrecomendadosModels2;
  // Stores action output result for [Backend Call - API (getsusc)] action in Button widget.
  ApiCallResponse? suscrip2;
  // Stores action output result for [Backend Call - API (getsusc)] action in Button widget.
  ApiCallResponse? suscrip22;
  Stream<List<RelevantAlertsTableRow>>? alertasservicioSupabaseStream;

  @override
  void initState(BuildContext context) {
    categoriaindividualModels =
        FlutterFlowDynamicModels(() => CategoriaindividualModel());
    profesionalesrecomendadosModels1 =
        FlutterFlowDynamicModels(() => ProfesionalesrecomendadosModel());
    profesionalesrecomendadosModels2 =
        FlutterFlowDynamicModels(() => ProfesionalesrecomendadosModel());
  }

  @override
  void dispose() {
    buscarprofeisonalFocusNode?.dispose();

    categoriaindividualModels.dispose();
    profesionalesrecomendadosModels1.dispose();
    profesionalesrecomendadosModels2.dispose();
  }
}
