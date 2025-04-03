import '/flutter_flow/flutter_flow_util.dart';
import 'chats_component_widget.dart' show ChatsComponentWidget;
import 'package:flutter/material.dart';

class ChatsComponentModel extends FlutterFlowModel<ChatsComponentWidget> {
  ///  State fields for stateful widgets in this component.

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
