import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_alerta_widget.dart' show ChatAlertaWidget;
import 'package:flutter/material.dart';

class ChatAlertaModel extends FlutterFlowModel<ChatAlertaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in chatAlerta widget.
  List<ChatsRow>? mensajes;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  Stream<List<ChatsRow>>? listViewSupabaseStream;
  // State field(s) for Input_text widget.
  FocusNode? inputTextFocusNode;
  TextEditingController? inputTextTextController;
  String? Function(BuildContext, String?)? inputTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
    inputTextFocusNode?.dispose();
    inputTextTextController?.dispose();
  }
}
