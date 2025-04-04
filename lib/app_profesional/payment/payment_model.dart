import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  ///  Local state fields for this page.

  String? emailmp;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? user;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? email;
  // Stores action output result for [Backend Call - API (createsuscription)] action in Button widget.
  ApiCallResponse? crearsuscripcion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
