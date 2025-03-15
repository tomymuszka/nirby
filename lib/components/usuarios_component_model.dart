import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usuarios_component_widget.dart' show UsuariosComponentWidget;
import 'package:flutter/material.dart';

class UsuariosComponentModel extends FlutterFlowModel<UsuariosComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (buscarusuarios)] action in IconButton widget.
  ApiCallResponse? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
