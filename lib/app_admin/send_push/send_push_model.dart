import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'send_push_widget.dart' show SendPushWidget;
import 'package:flutter/material.dart';

class SendPushModel extends FlutterFlowModel<SendPushWidget> {
  ///  Local state fields for this page.

  List<UsuariosRow> usuarios = [];
  void addToUsuarios(UsuariosRow item) => usuarios.add(item);
  void removeFromUsuarios(UsuariosRow item) => usuarios.remove(item);
  void removeAtIndexFromUsuarios(int index) => usuarios.removeAt(index);
  void insertAtIndexInUsuarios(int index, UsuariosRow item) =>
      usuarios.insert(index, item);
  void updateUsuariosAtIndex(int index, Function(UsuariosRow) updateFn) =>
      usuarios[index] = updateFn(usuarios[index]);

  int? index = 0;

  List<String> verificados = [];
  void addToVerificados(String item) => verificados.add(item);
  void removeFromVerificados(String item) => verificados.remove(item);
  void removeAtIndexFromVerificados(int index) => verificados.removeAt(index);
  void insertAtIndexInVerificados(int index, String item) =>
      verificados.insert(index, item);
  void updateVerificadosAtIndex(int index, Function(String) updateFn) =>
      verificados[index] = updateFn(verificados[index]);

  List<String> suscripcionactiva = [];
  void addToSuscripcionactiva(String item) => suscripcionactiva.add(item);
  void removeFromSuscripcionactiva(String item) =>
      suscripcionactiva.remove(item);
  void removeAtIndexFromSuscripcionactiva(int index) =>
      suscripcionactiva.removeAt(index);
  void insertAtIndexInSuscripcionactiva(int index, String item) =>
      suscripcionactiva.insert(index, item);
  void updateSuscripcionactivaAtIndex(int index, Function(String) updateFn) =>
      suscripcionactiva[index] = updateFn(suscripcionactiva[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for usuarios widget.
  List<String>? usuariosValue;
  FormFieldController<List<String>>? usuariosValueController;
  // Stores action output result for [Backend Call - Query Rows] action in usuarios widget.
  List<UsuariosRow>? userslist;
  // State field(s) for verificados widget.
  FormFieldController<List<String>>? verificadosValueController;
  List<String>? get verificadosValues => verificadosValueController?.value;
  set verificadosValues(List<String>? v) =>
      verificadosValueController?.value = v;

  // State field(s) for estadosuscripcion widget.
  FormFieldController<List<String>>? estadosuscripcionValueController;
  List<String>? get estadosuscripcionValues =>
      estadosuscripcionValueController?.value;
  set estadosuscripcionValues(List<String>? v) =>
      estadosuscripcionValueController?.value = v;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios13;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios14;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios15;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios16;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios5;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios6;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios7;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios8;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios9;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios10;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios11;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarios12;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
