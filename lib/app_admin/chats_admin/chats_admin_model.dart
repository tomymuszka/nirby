import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'chats_admin_widget.dart' show ChatsAdminWidget;
import 'package:flutter/material.dart';

class ChatsAdminModel extends FlutterFlowModel<ChatsAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navbarModel.dispose();
  }
}
