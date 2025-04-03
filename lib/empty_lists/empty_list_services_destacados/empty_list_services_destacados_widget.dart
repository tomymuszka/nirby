import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_list_services_destacados_model.dart';
export 'empty_list_services_destacados_model.dart';

class EmptyListServicesDestacadosWidget extends StatefulWidget {
  const EmptyListServicesDestacadosWidget({super.key});

  @override
  State<EmptyListServicesDestacadosWidget> createState() =>
      _EmptyListServicesDestacadosWidgetState();
}

class _EmptyListServicesDestacadosWidgetState
    extends State<EmptyListServicesDestacadosWidget> {
  late EmptyListServicesDestacadosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListServicesDestacadosModel());

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
        FaIcon(
          FontAwesomeIcons.list,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'No se encontraron servicios destacados',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
