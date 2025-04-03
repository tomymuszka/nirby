import '/backend/supabase/supabase.dart';
import '/components/alerta_de_servicio_component_widget.dart';
import '/components/chats_component_widget.dart';
import '/components/home_component_widget.dart';
import '/components/profile_component_widget.dart';
import '/components/servicios_component_widget.dart';
import '/components/usuarios_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int? servicioseleccionado;

  int? index = 0;

  String paginaSeleccionada = 'Home';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<ReviewsRow>? resenas;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Home widget.
  bool? hired;
  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<UsuariosRow>? profesional;
  // Model for HomeComponent component.
  late HomeComponentModel homeComponentModel;
  // Model for ChatsComponent component.
  late ChatsComponentModel chatsComponentModel;
  // Model for alerta_de_servicio_component component.
  late AlertaDeServicioComponentModel alertaDeServicioComponentModel;
  // Model for ProfileComponent component.
  late ProfileComponentModel profileComponentModel;
  // Model for ServiciosComponent component.
  late ServiciosComponentModel serviciosComponentModel;
  // Model for UsuariosComponent component.
  late UsuariosComponentModel usuariosComponentModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    homeComponentModel = createModel(context, () => HomeComponentModel());
    chatsComponentModel = createModel(context, () => ChatsComponentModel());
    alertaDeServicioComponentModel =
        createModel(context, () => AlertaDeServicioComponentModel());
    profileComponentModel = createModel(context, () => ProfileComponentModel());
    serviciosComponentModel =
        createModel(context, () => ServiciosComponentModel());
    usuariosComponentModel =
        createModel(context, () => UsuariosComponentModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    homeComponentModel.dispose();
    chatsComponentModel.dispose();
    alertaDeServicioComponentModel.dispose();
    profileComponentModel.dispose();
    serviciosComponentModel.dispose();
    usuariosComponentModel.dispose();
    navbarModel.dispose();
  }
}
