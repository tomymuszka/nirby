import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_alerta_widget.dart' show ChatAlertaWidget;
import 'package:flutter/material.dart';

class ChatAlertaModel extends FlutterFlowModel<ChatAlertaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in chatAlerta widget.
  List<ChatsRow>? mensajes;
  Stream<List<ChatsFilteredRow>>? columnSupabaseStream;
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
