import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'bigger_image_model.dart';
export 'bigger_image_model.dart';

class BiggerImageWidget extends StatefulWidget {
  const BiggerImageWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<BiggerImageWidget> createState() => _BiggerImageWidgetState();
}

class _BiggerImageWidgetState extends State<BiggerImageWidget> {
  late BiggerImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiggerImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        alignment: AlignmentDirectional(1.0, -1.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              widget.url!,
              width: 300.0,
              height: 300.0,
              fit: BoxFit.cover,
              alignment: Alignment(1.0, -1.0),
            ),
          ),
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
