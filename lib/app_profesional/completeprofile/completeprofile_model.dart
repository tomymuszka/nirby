import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'completeprofile_widget.dart' show CompleteprofileWidget;
import 'package:flutter/material.dart';

class CompleteprofileModel extends FlutterFlowModel<CompleteprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title_profesional widget.
  FocusNode? titleProfesionalFocusNode;
  TextEditingController? titleProfesionalTextController;
  String? Function(BuildContext, String?)?
      titleProfesionalTextControllerValidator;
  String? _titleProfesionalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar un título';
    }

    return null;
  }

  // State field(s) for anos_experiencia widget.
  FocusNode? anosExperienciaFocusNode;
  TextEditingController? anosExperienciaTextController;
  String? Function(BuildContext, String?)?
      anosExperienciaTextControllerValidator;
  String? _anosExperienciaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debés ingresar tus años de experiencia';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    titleProfesionalTextControllerValidator =
        _titleProfesionalTextControllerValidator;
    anosExperienciaTextControllerValidator =
        _anosExperienciaTextControllerValidator;
  }

  @override
  void dispose() {
    titleProfesionalFocusNode?.dispose();
    titleProfesionalTextController?.dispose();

    anosExperienciaFocusNode?.dispose();
    anosExperienciaTextController?.dispose();
  }
}
