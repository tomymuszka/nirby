import '/flutter_flow/flutter_flow_util.dart';
import 'create_revirepopup_widget.dart' show CreateRevirepopupWidget;
import 'package:flutter/material.dart';

class CreateRevirepopupModel extends FlutterFlowModel<CreateRevirepopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
