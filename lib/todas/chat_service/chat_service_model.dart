import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_service_widget.dart' show ChatServiceWidget;
import 'package:flutter/material.dart';

class ChatServiceModel extends FlutterFlowModel<ChatServiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in chatService widget.
  List<ChatsRow>? mensajes;
  // State field(s) for Chat widget.
  ScrollController? chat;
  Stream<List<ChatsRow>>? chatSupabaseStream;
  // State field(s) for Input_text widget.
  FocusNode? inputTextFocusNode;
  TextEditingController? inputTextTextController;
  String? Function(BuildContext, String?)? inputTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    chat = ScrollController();
  }

  @override
  void dispose() {
    chat?.dispose();
    inputTextFocusNode?.dispose();
    inputTextTextController?.dispose();
  }
}
