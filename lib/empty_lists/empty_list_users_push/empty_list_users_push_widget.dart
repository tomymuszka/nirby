import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'empty_list_users_push_model.dart';
export 'empty_list_users_push_model.dart';

class EmptyListUsersPushWidget extends StatefulWidget {
  const EmptyListUsersPushWidget({super.key});

  @override
  State<EmptyListUsersPushWidget> createState() =>
      _EmptyListUsersPushWidgetState();
}

class _EmptyListUsersPushWidgetState extends State<EmptyListUsersPushWidget> {
  late EmptyListUsersPushModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListUsersPushModel());

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
          Icons.person,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'No se encontraron usuarios',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
