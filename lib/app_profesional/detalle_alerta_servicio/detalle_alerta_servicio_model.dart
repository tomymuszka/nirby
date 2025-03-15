import '/backend/supabase/supabase.dart';
import '/components/alertaeliminada_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'detalle_alerta_servicio_widget.dart' show DetalleAlertaServicioWidget;
import 'package:flutter/material.dart';

class DetalleAlertaServicioModel
    extends FlutterFlowModel<DetalleAlertaServicioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for alertaeliminada component.
  late AlertaeliminadaModel alertaeliminadaModel;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonPrimary widget.
  List<UsuariosAlertasRow>? existeAlerta;
  Completer<List<UsuariosAlertasRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonPrimary widget.
  List<UsuariosAlertasRow>? existeAlerta2;

  @override
  void initState(BuildContext context) {
    alertaeliminadaModel = createModel(context, () => AlertaeliminadaModel());
  }

  @override
  void dispose() {
    alertaeliminadaModel.dispose();
  }

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
