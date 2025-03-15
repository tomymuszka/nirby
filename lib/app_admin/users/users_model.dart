import '/components/usuarios_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_widget.dart' show UsersWidget;
import 'package:flutter/material.dart';

class UsersModel extends FlutterFlowModel<UsersWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UsuariosComponent component.
  late UsuariosComponentModel usuariosComponentModel;

  @override
  void initState(BuildContext context) {
    usuariosComponentModel =
        createModel(context, () => UsuariosComponentModel());
  }

  @override
  void dispose() {
    usuariosComponentModel.dispose();
  }
}
