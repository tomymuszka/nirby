import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés incluir un email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El email no es válido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  String? _passwordTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes indicar una contraseña';
    }

    if (val.length < 7) {
      return 'La contraseña debe tener al menos 7 caracteres';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;
  String? _passwordTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes confirmar la contraseña';
    }

    return null;
  }

  // State field(s) for terminosaceptados widget.
  bool? terminosaceptadosValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? emailexiste;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility1 = false;
    passwordTextController1Validator = _passwordTextController1Validator;
    passwordVisibility2 = false;
    passwordTextController2Validator = _passwordTextController2Validator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();
  }
}
