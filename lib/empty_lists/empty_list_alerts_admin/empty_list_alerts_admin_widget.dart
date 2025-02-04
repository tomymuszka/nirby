import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_alerts_admin_model.dart';
export 'empty_list_alerts_admin_model.dart';

class EmptyListAlertsAdminWidget extends StatefulWidget {
  const EmptyListAlertsAdminWidget({super.key});

  @override
  State<EmptyListAlertsAdminWidget> createState() =>
      _EmptyListAlertsAdminWidgetState();
}

class _EmptyListAlertsAdminWidgetState
    extends State<EmptyListAlertsAdminWidget> {
  late EmptyListAlertsAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListAlertsAdminModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.add_alert,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'No se encontraron alertas',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
