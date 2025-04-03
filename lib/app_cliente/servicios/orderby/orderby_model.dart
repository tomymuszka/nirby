import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'orderby_widget.dart' show OrderbyWidget;
import 'package:flutter/material.dart';

class OrderbyModel extends FlutterFlowModel<OrderbyWidget> {
  ///  Local state fields for this component.

  String? seleccionactual;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for zona widget.
  FormFieldController<List<String>>? zonaValueController;
  List<String>? get zonaValues => zonaValueController?.value;
  set zonaValues(List<String>? v) => zonaValueController?.value = v;

  // State field(s) for presupuesto widget.
  FormFieldController<List<String>>? presupuestoValueController;
  List<String>? get presupuestoValues => presupuestoValueController?.value;
  set presupuestoValues(List<String>? v) =>
      presupuestoValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
