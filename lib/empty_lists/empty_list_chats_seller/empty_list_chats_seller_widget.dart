import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_chats_seller_model.dart';
export 'empty_list_chats_seller_model.dart';

class EmptyListChatsSellerWidget extends StatefulWidget {
  const EmptyListChatsSellerWidget({super.key});

  @override
  State<EmptyListChatsSellerWidget> createState() =>
      _EmptyListChatsSellerWidgetState();
}

class _EmptyListChatsSellerWidgetState
    extends State<EmptyListChatsSellerWidget> {
  late EmptyListChatsSellerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListChatsSellerModel());

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
          Icons.chat_outlined,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'No tenés chats',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Text(
            'Parace que todavía no has iniciado ningún chat.\n\nNo te preocupes, ya comenzarán a llegar :)',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
