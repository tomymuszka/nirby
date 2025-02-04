import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int? servicioseleccionado;

  int? index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<ReviewsRow>? resenas;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Home widget.
  bool? hired;
  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<UsuariosRow>? profesional;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (buscarservicio)] action in IconButton widget.
  ApiCallResponse? servicioselected;
  // Stores action output result for [Backend Call - API (getsusc)] action in Button widget.
  ApiCallResponse? suscrip2;
  // Stores action output result for [Backend Call - API (getsusc)] action in Button widget.
  ApiCallResponse? suscrip22;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    navbarModel.dispose();
  }
}
