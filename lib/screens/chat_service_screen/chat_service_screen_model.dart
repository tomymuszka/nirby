import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_service_screen_widget.dart' show ChatServiceScreenWidget;
import 'package:flutter/material.dart';

class ChatServiceScreenModel extends FlutterFlowModel<ChatServiceScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in chatServiceScreen widget.
  List<ChatsRow>? mensajes;
  // State field(s) for Input_text widget.
  FocusNode? inputTextFocusNode;
  TextEditingController? inputTextTextController;
  String? Function(BuildContext, String?)? inputTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputTextFocusNode?.dispose();
    inputTextTextController?.dispose();
  }
}
