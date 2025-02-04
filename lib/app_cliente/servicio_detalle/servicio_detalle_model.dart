import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'servicio_detalle_widget.dart' show ServicioDetalleWidget;
import 'package:flutter/material.dart';

class ServicioDetalleModel extends FlutterFlowModel<ServicioDetalleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ConversationsRow>? conversacionExistente;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversationsRow? conversation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
