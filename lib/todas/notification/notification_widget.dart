import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_notifications/empty_notifications_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/delete_notification/delete_notification_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  static String routeName = 'notification';
  static String routePath = '/notification';

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkConnection(context);
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Color(0x004B39EF),
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF374151),
              size: 24.0,
            ),
            onPressed: () async {
              context.goNamed(
                HomeWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
          ),
          title: Text(
            'Notificaciones',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Color(0xFF374151),
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: FutureBuilder<List<NotificationsUsersRow>>(
                  future: (_model.requestCompleter ??=
                          Completer<List<NotificationsUsersRow>>()
                            ..complete(NotificationsUsersTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'user',
                                    currentUserUid,
                                  )
                                  .neqOrNull(
                                    'accion',
                                    'nuevo_mensaje',
                                  )
                                  .order('id'),
                            )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                          ),
                        ),
                      );
                    }
                    List<NotificationsUsersRow>
                        notificacionesNotificationsUsersRowList =
                        snapshot.data!;

                    if (notificacionesNotificationsUsersRowList.isEmpty) {
                      return EmptyNotificationsWidget();
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        safeSetState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            notificacionesNotificationsUsersRowList.length,
                        itemBuilder: (context, notificacionesIndex) {
                          final notificacionesNotificationsUsersRow =
                              notificacionesNotificationsUsersRowList[
                                  notificacionesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (notificacionesNotificationsUsersRow
                                      .idAlertaServicio !=
                                  null) {
                                await NotificationsUsersTable().update(
                                  data: {
                                    'seen': true,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    notificacionesNotificationsUsersRow.id,
                                  ),
                                );

                                context.pushNamed(
                                  DetalleAlertaServicioWidget.routeName,
                                  queryParameters: {
                                    'id': serializeParam(
                                      notificacionesNotificationsUsersRow
                                          .idAlertaServicio,
                                      ParamType.int,
                                    ),
                                    'comesfromnotifications': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            },
                            onLongPress: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: 200.0,
                                        child: DeleteNotificationWidget(
                                          notification:
                                              notificacionesNotificationsUsersRow
                                                  .id,
                                          seen:
                                              notificacionesNotificationsUsersRow
                                                  .seen!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(
                                  () => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color:
                                      notificacionesNotificationsUsersRow.seen!
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 4.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color:
                                              !notificacionesNotificationsUsersRow
                                                      .seen!
                                                  ? Color(0xFF3D64FF)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    35.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (!notificacionesNotificationsUsersRow
                                                                .seen!)
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    notificacionesNotificationsUsersRow
                                                                        .title,
                                                                    'Sin título',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF1C2A3A),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (notificacionesNotificationsUsersRow
                                                                    .seen ??
                                                                true)
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    notificacionesNotificationsUsersRow
                                                                        .title,
                                                                    'Sin título',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF1C2A3A),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          dateTimeFormat(
                                                            "relative",
                                                            notificacionesNotificationsUsersRow
                                                                .createdAt,
                                                            locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageShortCode ??
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xFF1C2A3A),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          notificacionesNotificationsUsersRow
                                                              .content,
                                                          'Contenido',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: Color(
                                                                  0xFF6B7280),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
