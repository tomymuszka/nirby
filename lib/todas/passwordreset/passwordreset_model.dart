import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'passwordreset_widget.dart' show PasswordresetWidget;
import 'package:flutter/material.dart';

class PasswordresetModel extends FlutterFlowModel<PasswordresetWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contra1 widget.
  FocusNode? contra1FocusNode;
  TextEditingController? contra1TextController;
  late bool contra1Visibility;
  String? Function(BuildContext, String?)? contra1TextControllerValidator;
  String? _contra1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés indicar una contraseña';
    }

    if (val.length < 7) {
      return 'La contraseña debe tener al menos 7 caracteres';
    }

    return null;
  }

  // State field(s) for contra2 widget.
  FocusNode? contra2FocusNode;
  TextEditingController? contra2TextController;
  late bool contra2Visibility;
  String? Function(BuildContext, String?)? contra2TextControllerValidator;
  String? _contra2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés indicar una contraseña';
    }

    if (val.length < 7) {
      return 'La contraseña debe tener al menos 7 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    contra1Visibility = false;
    contra1TextControllerValidator = _contra1TextControllerValidator;
    contra2Visibility = false;
    contra2TextControllerValidator = _contra2TextControllerValidator;
  }

  @override
  void dispose() {
    contra1FocusNode?.dispose();
    contra1TextController?.dispose();

    contra2FocusNode?.dispose();
    contra2TextController?.dispose();
  }
}
