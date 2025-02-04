import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signin1_widget.dart' show Signin1Widget;
import 'package:flutter/material.dart';

class Signin1Model extends FlutterFlowModel<Signin1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar un nombre';
    }

    return null;
  }

  // State field(s) for apellido widget.
  FocusNode? apellidoFocusNode;
  TextEditingController? apellidoTextController;
  String? Function(BuildContext, String?)? apellidoTextControllerValidator;
  String? _apellidoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar un apellido';
    }

    return null;
  }

  // State field(s) for DNI widget.
  FocusNode? dniFocusNode;
  TextEditingController? dniTextController;
  String? Function(BuildContext, String?)? dniTextControllerValidator;
  String? _dniTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés completar tu DNI';
    }

    if (val.length > 8) {
      return 'Solo puedes agregar 8 caracteres';
    }

    return null;
  }

  // State field(s) for pais_residencia widget.
  FocusNode? paisResidenciaFocusNode;
  TextEditingController? paisResidenciaTextController;
  String? Function(BuildContext, String?)?
      paisResidenciaTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in boton widget.
  List<UsuariosRow>? usuarioexistente;
  // Stores action output result for [Custom Action - getOneSignalPlayerId] action in boton widget.
  String? playerid;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    apellidoTextControllerValidator = _apellidoTextControllerValidator;
    dniTextControllerValidator = _dniTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoTextController?.dispose();

    dniFocusNode?.dispose();
    dniTextController?.dispose();

    paisResidenciaFocusNode?.dispose();
    paisResidenciaTextController?.dispose();
  }
}
