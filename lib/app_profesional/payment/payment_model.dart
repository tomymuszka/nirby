import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? user;
  // Stores action output result for [Backend Call - API (createsuscription)] action in Button widget.
  ApiCallResponse? crearsuscripcion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
