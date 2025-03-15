import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalle_usuario_admin_widget.dart' show DetalleUsuarioAdminWidget;
import 'package:flutter/material.dart';

class DetalleUsuarioAdminModel
    extends FlutterFlowModel<DetalleUsuarioAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
