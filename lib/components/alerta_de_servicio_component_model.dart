import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alerta_de_servicio_component_widget.dart'
    show AlertaDeServicioComponentWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AlertaDeServicioComponentModel
    extends FlutterFlowModel<AlertaDeServicioComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? confirm;
  Completer<List<AlertasRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
