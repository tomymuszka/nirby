import '';
import '/app_cliente/home/contacted_professional_popup/contacted_professional_popup_widget.dart';
import '/app_cliente/home/create_revirepopup/create_revirepopup_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alerta_de_servicio_component_widget.dart';
import '/components/chats_component_widget.dart';
import '/components/home_component_widget.dart';
import '/components/no_contrato_profesional_widget.dart';
import '/components/profile_component_widget.dart';
import '/components/servicios_component_widget.dart';
import '/components/usuarios_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

/// pagina de la home
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkConnection(context);
      if (!loggedIn) {
        return;
      }
      safeSetState(() {
        _model.homeComponentModel.buscarprofeisonalTextController?.clear();
      });
      _model.resenas = await ReviewsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_client',
              currentUserUid,
            )
            .isFilter(
              'contrato',
              null,
            )
            .lteOrNull(
              'created_at',
              supaSerialize<DateTime>(
                  functions.timebefore(getCurrentTimestamp, 72)),
            )
            .order('id', ascending: true),
      );
      if (_model.resenas != null && (_model.resenas)!.isNotEmpty) {
        while (_model.index! < _model.resenas!.length) {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ContactedProfessionalPopupWidget(
                    id: _model.resenas!.elementAtOrNull(_model.index!)!.id,
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() => _model.hired = value));

          if (_model.hired == true) {
            _model.profesional = await UsuariosTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'id',
                _model.resenas?.elementAtOrNull(_model.index!)?.userProfesional,
              ),
            );
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: CreateRevirepopupWidget(
                      nombre:
                          '${_model.profesional?.firstOrNull?.nombre} ${_model.profesional?.firstOrNull?.apellido}',
                      titulo: _model.profesional!.firstOrNull!.titulo!,
                      foto: _model.profesional!.firstOrNull!.foto!,
                      id: _model.resenas!.elementAtOrNull(_model.index!)!.id,
                    ),
                  ),
                );
              },
            );
          } else {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: NoContratoProfesionalWidget(),
                  ),
                );
              },
            );
          }

          _model.index = _model.index! + 1;
          safeSetState(() {});
        }
      }
    });

    animationsMap.addAll({
      'homeComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'chatsComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'alertaDeServicioComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'profileComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'serviciosComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => FutureBuilder<List<UsuariosRow>>(
        future: UsuariosTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            currentUserUid,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
              ),
            );
          }
          List<UsuariosRow> homeUsuariosRowList = snapshot.data!;

          final homeUsuariosRow =
              homeUsuariosRowList.isNotEmpty ? homeUsuariosRowList.first : null;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().PaginaSeleccionada == 'Home')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.homeComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: HomeComponentWidget(
                                  parameter1: homeUsuariosRow?.admin,
                                  parameter2: homeUsuariosRow?.verified,
                                  parameter3: homeUsuariosRow?.idsuscripcion,
                                  parameter4: homeUsuariosRow?.enVerificacion,
                                  parameter5: homeUsuariosRow?.seSuscribioAntes,
                                  parameter6: homeUsuariosRow?.nombre,
                                  parameter7:
                                      homeUsuariosRow?.suscripcionActiva,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'homeComponentOnPageLoadAnimation']!),
                            ),
                          if (FFAppState().PaginaSeleccionada == 'Chats')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.chatsComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ChatsComponentWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'chatsComponentOnPageLoadAnimation']!),
                            ),
                          if (FFAppState().PaginaSeleccionada == 'Alertas')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.alertaDeServicioComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AlertaDeServicioComponentWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'alertaDeServicioComponentOnPageLoadAnimation']!),
                            ),
                          if (FFAppState().PaginaSeleccionada == 'Profile')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.profileComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileComponentWidget(
                                  parameter1: homeUsuariosRow?.foto,
                                  parameter2: homeUsuariosRow?.nombre,
                                  parameter3: homeUsuariosRow?.apellido,
                                  parameter4: homeUsuariosRow?.email,
                                  parameter5: homeUsuariosRow?.anosexperiencia,
                                  parameter7: homeUsuariosRow?.titulo,
                                  parameter8: !homeUsuariosRow!.admin!,
                                  parameter9: homeUsuariosRow.foto,
                                  parameter10: homeUsuariosRow.verified,
                                  parameter11: homeUsuariosRow.idsuscripcion,
                                  parameter12: homeUsuariosRow.enVerificacion,
                                  parameter13: !homeUsuariosRow.admin!,
                                  parameter14: homeUsuariosRow.admin,
                                  parameter6: homeUsuariosRow.fechaNacimiento,
                                  emailconfirmado:
                                      homeUsuariosRow.emailconfirmado!,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'profileComponentOnPageLoadAnimation']!),
                            ),
                          if (FFAppState().PaginaSeleccionada == 'Servicios')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.serviciosComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ServiciosComponentWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'serviciosComponentOnPageLoadAnimation']!),
                            ),
                          if (FFAppState().PaginaSeleccionada == 'Usuarios')
                            Expanded(
                              child: wrapWithModel(
                                model: _model.usuariosComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: UsuariosComponentWidget(),
                              ),
                            ),
                          if (loggedIn)
                            Container(
                              width: double.infinity,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child:
                                  FutureBuilder<List<UnseenMessagesCountRow>>(
                                future:
                                    UnseenMessagesCountTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UnseenMessagesCountRow>
                                      navbarUnseenMessagesCountRowList =
                                      snapshot.data!;

                                  final navbarUnseenMessagesCountRow =
                                      navbarUnseenMessagesCountRowList
                                              .isNotEmpty
                                          ? navbarUnseenMessagesCountRowList
                                              .first
                                          : null;

                                  return wrapWithModel(
                                    model: _model.navbarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NavbarWidget(
                                      admin: homeUsuariosRow!.admin!,
                                      photo: homeUsuariosRow.foto!,
                                      numbermessages:
                                          navbarUnseenMessagesCountRow
                                              ?.unseenCount,
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
