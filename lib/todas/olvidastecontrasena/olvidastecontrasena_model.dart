import '/flutter_flow/flutter_flow_util.dart';
import 'olvidastecontrasena_widget.dart' show OlvidastecontrasenaWidget;
import 'package:flutter/material.dart';

class OlvidastecontrasenaModel
    extends FlutterFlowModel<OlvidastecontrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
