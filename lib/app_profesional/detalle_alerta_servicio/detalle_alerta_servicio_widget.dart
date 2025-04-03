import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alertaeliminada_widget.dart';
import '/components/bigger_image_widget.dart';
import '/components/informationaldialogo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'detalle_alerta_servicio_model.dart';
export 'detalle_alerta_servicio_model.dart';

/// Mejora el diseño de esta pagina con los mismos componentes
class DetalleAlertaServicioWidget extends StatefulWidget {
  const DetalleAlertaServicioWidget({
    super.key,
    required this.id,
    bool? comesfromnotifications,
  }) : this.comesfromnotifications = comesfromnotifications ?? false;

  final int? id;
  final bool comesfromnotifications;

  static String routeName = 'detalleAlertaServicio';
  static String routePath = '/detalleAlertaServicio';

  @override
  State<DetalleAlertaServicioWidget> createState() =>
      _DetalleAlertaServicioWidgetState();
}

class _DetalleAlertaServicioWidgetState
    extends State<DetalleAlertaServicioWidget> {
  late DetalleAlertaServicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalleAlertaServicioModel());

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
    return FutureBuilder<List<AlertasRow>>(
      future: AlertasTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<AlertasRow> detalleAlertaServicioAlertasRowList = snapshot.data!;

        final detalleAlertaServicioAlertasRow =
            detalleAlertaServicioAlertasRowList.isNotEmpty
                ? detalleAlertaServicioAlertasRowList.first
                : null;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.comesfromnotifications) {
                  context.goNamed(
                    NotificationWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                      ),
                    },
                  );
                } else {
                  context.goNamed(
                    HomeWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                      ),
                    },
                  );
                }
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Text(
              'Alerta de servicio',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: FutureBuilder<List<UsuariosAlertasRow>>(
              future: (_model.requestCompleter ??=
                      Completer<List<UsuariosAlertasRow>>()
                        ..complete(UsuariosAlertasTable().querySingleRow(
                          queryFn: (q) => q
                              .eqOrNull(
                                'alerta_id',
                                widget.id,
                              )
                              .eqOrNull(
                                'profesional_interesado',
                                currentUserUid,
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
                List<UsuariosAlertasRow>
                    detalleAlertaServiciUsuariosAlertasRowList = snapshot.data!;

                final detalleAlertaServiciUsuariosAlertasRow =
                    detalleAlertaServiciUsuariosAlertasRowList.isNotEmpty
                        ? detalleAlertaServiciUsuariosAlertasRowList.first
                        : null;

                return Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (detalleAlertaServicioAlertasRow!.isDeleted! ||
                          !detalleAlertaServicioAlertasRow.active!)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.alertaeliminadaModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AlertaeliminadaWidget(),
                            ),
                          ],
                        ),
                      if (!detalleAlertaServicioAlertasRow.isDeleted! &&
                          detalleAlertaServicioAlertasRow.active!)
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (detalleAlertaServiciUsuariosAlertasRow?.id !=
                                  null)
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (detalleAlertaServiciUsuariosAlertasRow
                                              ?.profesionalInterested ==
                                          true) {
                                        return FlutterFlowTheme.of(context)
                                            .secondary;
                                      } else if (detalleAlertaServiciUsuariosAlertasRow
                                              ?.profesionalInterested ==
                                          false) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryBackground;
                                      }
                                    }(),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          detalleAlertaServiciUsuariosAlertasRow
                                                      ?.profesionalInterested ==
                                                  true
                                              ? 'Te has postulado a esta oferta'
                                              : 'Has rechazado esta oferta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if ((detalleAlertaServicioAlertasRow.images)
                                      .isNotEmpty)
                                Builder(
                                  builder: (context) {
                                    final fotos =
                                        detalleAlertaServicioAlertasRow.images
                                                .toList() ??
                                            [];

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(fotos.length,
                                            (fotosIndex) {
                                          final fotosItem = fotos[fotosIndex];
                                          return Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child:
                                                            BiggerImageWidget(
                                                          url: fotosItem,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    fotosItem,
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FutureBuilder<List<UsuariosRow>>(
                                        future: UsuariosTable().querySingleRow(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            detalleAlertaServicioAlertasRow
                                                .userEmitedAlert,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsuariosRow>
                                              detalleProfesionalUsuariosRowList =
                                              snapshot.data!;

                                          final detalleProfesionalUsuariosRow =
                                              detalleProfesionalUsuariosRowList
                                                      .isNotEmpty
                                                  ? detalleProfesionalUsuariosRowList
                                                      .first
                                                  : null;

                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              detalleProfesionalUsuariosRow!
                                                                  .foto!,
                                                              width: 70.0,
                                                              height: 70.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      '${detalleProfesionalUsuariosRow.nombre} ${detalleProfesionalUsuariosRow.apellido}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF1F2A37),
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  detalleAlertaServicioAlertasRow
                                                      .area,
                                                  'Sin area',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (detalleAlertaServicioAlertasRow
                                            .dateComplete !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      "d/M/y",
                                                      detalleAlertaServicioAlertasRow
                                                          .dateComplete,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    'Sin fecha',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Descripción',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              valueOrDefault<String>(
                                                detalleAlertaServicioAlertasRow
                                                    .descripcion,
                                                'Descripción',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 32.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 24.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.existeAlerta =
                                            await UsuariosAlertasTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'alerta_id',
                                                widget.id,
                                              )
                                              .eqOrNull(
                                                'profesional_interesado',
                                                currentUserUid,
                                              ),
                                        );
                                        if ((_model.existeAlerta != null &&
                                                (_model.existeAlerta)!
                                                    .isNotEmpty) ==
                                            true) {
                                          await UsuariosAlertasTable().update(
                                            data: {
                                              'profesional_interested': true,
                                              'user_descarted_profesional':
                                                  false,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              _model.existeAlerta?.firstOrNull
                                                  ?.id,
                                            ),
                                          );
                                        } else {
                                          await UsuariosAlertasTable().insert({
                                            'alerta_id': widget.id,
                                            'profesional_interesado':
                                                currentUserUid,
                                            'profesional_interested': true,
                                            'user_descarted_profesional': false,
                                          });
                                        }

                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: InformationaldialogoWidget(
                                                titulo: '¡Postulación exitosa!',
                                                cuerpo:
                                                    'Te has postulado exitosamente',
                                                buttonstring: 'Continuar',
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();
                                        FFAppState().PaginaSeleccionada =
                                            'Home';
                                        safeSetState(() {});

                                        context.pushNamed(HomeWidget.routeName);

                                        safeSetState(() {});
                                      },
                                      text: 'Postularme',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF1565C0),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.existeAlerta2 =
                                            await UsuariosAlertasTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'alerta_id',
                                                widget.id,
                                              )
                                              .eqOrNull(
                                                'profesional_interesado',
                                                currentUserUid,
                                              ),
                                        );
                                        if ((_model.existeAlerta2 != null &&
                                                (_model.existeAlerta2)!
                                                    .isNotEmpty) ==
                                            true) {
                                          await UsuariosAlertasTable().update(
                                            data: {
                                              'profesional_interested': false,
                                              'user_descarted_profesional':
                                                  true,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              _model.existeAlerta2?.firstOrNull
                                                  ?.id,
                                            ),
                                          );
                                        } else {
                                          await UsuariosAlertasTable().insert({
                                            'alerta_id': widget.id,
                                            'profesional_interesado':
                                                currentUserUid,
                                            'profesional_interested': false,
                                            'user_descarted_profesional': true,
                                          });
                                        }

                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: InformationaldialogoWidget(
                                                titulo:
                                                    'Rechazaste esta oferta',
                                                cuerpo:
                                                    'Has rechazado esta oferta',
                                                buttonstring: 'Continuar',
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();
                                        FFAppState().PaginaSeleccionada =
                                            'Home';
                                        safeSetState(() {});

                                        context.goNamed(HomeWidget.routeName);

                                        safeSetState(() {});
                                      },
                                      text: 'Rechazar y volver al listado',
                                      options: FFButtonOptions(
                                        width: 280.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFFDE4E4),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Color(0xFFD9534F),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
