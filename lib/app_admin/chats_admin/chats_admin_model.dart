import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chats_admin_widget.dart' show ChatsAdminWidget;
import 'package:flutter/material.dart';

class ChatsAdminModel extends FlutterFlowModel<ChatsAdminWidget> {
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
