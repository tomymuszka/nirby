import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:flutter/material.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
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
      return 'Debés ingresar un documento';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés indicar un email';
    }

    return null;
  }

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar un título';
    }

    return null;
  }

  // State field(s) for anosexperiencia widget.
  FocusNode? anosexperienciaFocusNode;
  TextEditingController? anosexperienciaTextController;
  String? Function(BuildContext, String?)?
      anosexperienciaTextControllerValidator;
  String? _anosexperienciaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar tus años de experiencia';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    apellidoTextControllerValidator = _apellidoTextControllerValidator;
    dniTextControllerValidator = _dniTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    titleTextControllerValidator = _titleTextControllerValidator;
    anosexperienciaTextControllerValidator =
        _anosexperienciaTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoTextController?.dispose();

    dniFocusNode?.dispose();
    dniTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();

    anosexperienciaFocusNode?.dispose();
    anosexperienciaTextController?.dispose();
  }
}
