import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_profesional_screen_widget.dart'
    show DetalleProfesionalScreenWidget;
import 'package:flutter/material.dart';

class DetalleProfesionalScreenModel
    extends FlutterFlowModel<DetalleProfesionalScreenWidget> {
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
