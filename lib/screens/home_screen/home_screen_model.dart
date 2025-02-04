import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  int? servicioseleccionado;

  int? index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomeScreen widget.
  List<ReviewsRow>? resenas;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in HomeScreen widget.
  bool? hired;
  // Stores action output result for [Backend Call - Query Rows] action in HomeScreen widget.
  List<UsuariosRow>? profesional;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ServicesRow>? servicioselected;
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
