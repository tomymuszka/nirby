import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'alertas_de_servicio_historia_widget.dart'
    show AlertasDeServicioHistoriaWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AlertasDeServicioHistoriaModel
    extends FlutterFlowModel<AlertasDeServicioHistoriaWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<AlertasRow>>? requestCompleter;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
