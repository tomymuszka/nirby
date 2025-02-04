import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'servicios_list_widget.dart' show ServiciosListWidget;
import 'package:flutter/material.dart';

class ServiciosListModel extends FlutterFlowModel<ServiciosListWidget> {
  ///  State fields for stateful widgets in this page.

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
}
