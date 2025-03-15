import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmdialog_widget.dart';
import '/empty_lists/empty_list_alerts_client/empty_list_alerts_client_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'alerta_de_servicio_component_model.dart';
export 'alerta_de_servicio_component_model.dart';

class AlertaDeServicioComponentWidget extends StatefulWidget {
  const AlertaDeServicioComponentWidget({super.key});

  @override
  State<AlertaDeServicioComponentWidget> createState() =>
      _AlertaDeServicioComponentWidgetState();
}

class _AlertaDeServicioComponentWidgetState
    extends State<AlertaDeServicioComponentWidget> {
  late AlertaDeServicioComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertaDeServicioComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 30.0, 5.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Alerta de servicio',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: Color(0xFFE8F5E9),
                icon: Icon(
                  Icons.add,
                  color: Color(0xFF388E3C),
                  size: 24.0,
                ),
                onPressed: () async {
                  FFAppState().fotossubidas = [];
                  safeSetState(() {});

                  context.pushNamed(CrearAlertaDeServicioWidget.routeName);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text(
                  'Debajo podrás visualizar tus alertas de servicio',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
            child: FutureBuilder<List<AlertasRow>>(
              future: (_model.requestCompleter ??= Completer<List<AlertasRow>>()
                    ..complete(AlertasTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'user_emited_alert',
                            currentUserUid,
                          )
                          .eqOrNull(
                            'is_deleted',
                            false,
                          ),
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
                List<AlertasRow> listViewAlertasRowList = snapshot.data!;

                if (listViewAlertasRowList.isEmpty) {
                  return EmptyListAlertsClientWidget();
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAlertasRowList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewAlertasRow =
                        listViewAlertasRowList[listViewIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            AlertasDeServicioProfesionalesWidget.routeName,
                            queryParameters: {
                              'idalerta': serializeParam(
                                listViewAlertasRow.id,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Container(
                                          width: 110.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: listViewAlertasRow.active!
                                                ? Color(0xFFE3F6E8)
                                                : Color(0xFFFDE4E4),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: listViewAlertasRow.active!
                                                  ? Color(0xFF2B7A4B)
                                                  : Color(0xFFD9534F),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: AutoSizeText(
                                                listViewAlertasRow.active!
                                                    ? 'Activo'
                                                    : 'Inactivo',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: listViewAlertasRow
                                                              .active!
                                                          ? Color(0xFF2B7A4B)
                                                          : Color(0xFFD9534F),
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewAlertasRow
                                                                .descripcion,
                                                            'descripcion',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 300,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          listViewAlertasRow
                                                              .area,
                                                          'area',
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    if (listViewAlertasRow
                                                            .dateComplete !=
                                                        null)
                                                      Flexible(
                                                        child: Text(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            listViewAlertasRow
                                                                .dateComplete!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: FutureBuilder<
                                                          List<
                                                              InterestedProfessionalsRow>>(
                                                        future:
                                                            InterestedProfessionalsTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'alerta_id',
                                                            listViewAlertasRow
                                                                .id,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<InterestedProfessionalsRow>
                                                              textInterestedProfessionalsRowList =
                                                              snapshot.data!;

                                                          return Text(
                                                            'Expertos postulados: ${textInterestedProfessionalsRowList.length.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFF1F2A37),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.chevron_right,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  indent: 20.0,
                                  endIndent: 20.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0xFFFFF9C4),
                                        icon: Icon(
                                          Icons.edit,
                                          color: Color(0xFFFBC02D),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          FFAppState().fechaNacimiento =
                                              listViewAlertasRow.dateComplete;
                                          FFAppState().fotossubidas =
                                              listViewAlertasRow.images
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});

                                          context.pushNamed(
                                            EditarAlertaDeServicioWidget
                                                .routeName,
                                            queryParameters: {
                                              'id': serializeParam(
                                                listViewAlertasRow.id,
                                                ParamType.int,
                                              ),
                                              'contadorinicial': serializeParam(
                                                listViewAlertasRow
                                                    .images.length,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0xFFFFEBEE),
                                          icon: Icon(
                                            Icons.delete,
                                            color: Color(0xFFD32F2F),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: ConfirmdialogWidget(
                                                    titulo: 'Eliminar alerta',
                                                    cuerpo:
                                                        '¿Estas seguro que deseas eliminar esta alerta de servicio?',
                                                    botonrechazar: 'No',
                                                    botonconfirmar:
                                                        'Si, eliminar',
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(
                                                () => _model.confirm = value));

                                            if (_model.confirm == true) {
                                              await AlertasTable().update(
                                                data: {
                                                  'is_deleted': true,
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  listViewAlertasRow.id,
                                                ),
                                              );
                                              safeSetState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
