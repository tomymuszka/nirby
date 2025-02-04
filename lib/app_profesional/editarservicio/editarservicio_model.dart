import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editarservicio_widget.dart' show EditarservicioWidget;
import 'package:flutter/material.dart';

class EditarservicioModel extends FlutterFlowModel<EditarservicioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, ingresá un nombre';
    }

    return null;
  }

  // State field(s) for precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  String? _precioTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, ingresá un precio';
    }

    return null;
  }

  // State field(s) for zonaaccion widget.
  FormFieldController<List<String>>? zonaaccionValueController;
  List<String>? get zonaaccionValues => zonaaccionValueController?.value;
  set zonaaccionValues(List<String>? v) => zonaaccionValueController?.value = v;

  // State field(s) for categoria widget.
  List<String>? categoriaValue;
  FormFieldController<List<String>>? categoriaValueController;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  String? _descripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, ingresá una descripción';
    }

    if (val.length > 300) {
      return 'El máximo es de 300 caracteres';
    }

    return null;
  }

  // State field(s) for urgencias widget.
  FormFieldController<String>? urgenciasValueController;
  // State field(s) for cobrapres widget.
  FormFieldController<String>? cobrapresValueController;
  // State field(s) for activo widget.
  bool? activoValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuario;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServicesRow>? servicioactivo;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CategoriasRow>? categoria;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    precioTextControllerValidator = _precioTextControllerValidator;
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    precioFocusNode?.dispose();
    precioTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }

  /// Additional helper methods.
  String? get urgenciasValue => urgenciasValueController?.value;
  String? get cobrapresValue => cobrapresValueController?.value;
}
