import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'olvidastecontrasena_widget.dart' show OlvidastecontrasenaWidget;
import 'package:flutter/material.dart';

class OlvidastecontrasenaModel
    extends FlutterFlowModel<OlvidastecontrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button-Login widget.
  List<UsuariosRow>? email;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
