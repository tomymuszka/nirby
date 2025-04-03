import '/flutter_flow/flutter_flow_util.dart';
import 'emailmercadopago_widget.dart' show EmailmercadopagoWidget;
import 'package:flutter/material.dart';

class EmailmercadopagoModel extends FlutterFlowModel<EmailmercadopagoWidget> {
  ///  Local state fields for this component.

  bool emailregistraste = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailregistrado widget.
  FocusNode? emailregistradoFocusNode;
  TextEditingController? emailregistradoTextController;
  String? Function(BuildContext, String?)?
      emailregistradoTextControllerValidator;
  String? _emailregistradoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés indicar tu email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for emailnuevo widget.
  FocusNode? emailnuevoFocusNode;
  TextEditingController? emailnuevoTextController;
  String? Function(BuildContext, String?)? emailnuevoTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    emailregistradoTextControllerValidator =
        _emailregistradoTextControllerValidator;
  }

  @override
  void dispose() {
    emailregistradoFocusNode?.dispose();
    emailregistradoTextController?.dispose();

    emailnuevoFocusNode?.dispose();
    emailnuevoTextController?.dispose();
  }
}
