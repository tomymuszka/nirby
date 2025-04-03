import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'servicio_detalle_screen_widget.dart' show ServicioDetalleScreenWidget;
import 'package:flutter/material.dart';

class ServicioDetalleScreenModel
    extends FlutterFlowModel<ServicioDetalleScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ConversationsRow>? conversacionExistente;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversationsRow? conversation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
