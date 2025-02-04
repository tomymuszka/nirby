import '/app_cliente/orderby/orderby_widget.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_services/empty_list_services_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'servicios_model.dart';
export 'servicios_model.dart';

/// Los servicios de los profesionales
class ServiciosWidget extends StatefulWidget {
  const ServiciosWidget({
    super.key,
    required this.categoriaid,
  });

  final int? categoriaid;

  @override
  State<ServiciosWidget> createState() => _ServiciosWidgetState();
}

class _ServiciosWidgetState extends State<ServiciosWidget> {
  late ServiciosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiciosModel());

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
            fillColor: const Color(0x004B39EF),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF374151),
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Servicios',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF374151),
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 25.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FutureBuilder<List<ServiceDetailsRow>>(
                                future: ServiceDetailsTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'active',
                                        true,
                                      )
                                      .containsOrNull(
                                        'categoria',
                                        '{${widget.categoriaid}}',
                                      )
                                      .overlapsOrNull(
                                        'coverage_areas',
                                        FFAppState().filtrozonacobertura,
                                      )
                                      .overlapsOrNull(
                                        'budget_no_charge',
                                        FFAppState().presupuesto,
                                      )
                                      .order('created_at', ascending: true),
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
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ServiceDetailsRow>
                                      textServiceDetailsRowList =
                                      snapshot.data!;

                                  return Text(
                                    '${textServiceDetailsRowList.length.toString()} encontrados',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFF1F2A37),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  );
                                },
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
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
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height: 600.0,
                                                child: OrderbyWidget(
                                                  valorInicial: _model.orderby,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.orderbyvalue = value));

                                      _model.orderby = _model.orderbyvalue!;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 7.0, 0.0),
                                          child: Text(
                                            'Filtros',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF6B7280),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        const FaIcon(
                                          FontAwesomeIcons.sortAmountUp,
                                          color: Color(0xFF6B7280),
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (_model.orderby == 'Mas recientes') {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceDetailsRow>>(
                                      future: ServiceDetailsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .containsOrNull(
                                              'categoria',
                                              '{${widget.categoriaid}}',
                                            )
                                            .overlapsOrNull(
                                              'coverage_areas',
                                              FFAppState().filtrozonacobertura,
                                            )
                                            .overlapsOrNull(
                                              'budget_no_charge',
                                              FFAppState().presupuesto,
                                            )
                                            .order('created_at'),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServiceDetailsRow>
                                            listaProfesionalesServiceDetailsRowList =
                                            snapshot.data!;

                                        if (listaProfesionalesServiceDetailsRowList
                                            .isEmpty) {
                                          return const EmptyListServicesWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listaProfesionalesServiceDetailsRowList
                                                  .length,
                                          itemBuilder: (context,
                                              listaProfesionalesIndex) {
                                            final listaProfesionalesServiceDetailsRow =
                                                listaProfesionalesServiceDetailsRowList[
                                                    listaProfesionalesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'servicio_detalle',
                                                    queryParameters: {
                                                      'service': serializeParam(
                                                        listaProfesionalesServiceDetailsRow
                                                            .serviceId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: 342.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    listaProfesionalesServiceDetailsRow
                                                                        .professionalFoto!,
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            listaProfesionalesServiceDetailsRow.title!,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: const Color(0xFF1F2A37),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (listaProfesionalesServiceDetailsRow
                                                                              .suscripcionActiva ??
                                                                          true)
                                                                        const Icon(
                                                                          Icons
                                                                              .verified,
                                                                          color:
                                                                              Color(0xFF52ABFF),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E7EB),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaProfesionalesServiceDetailsRow.professionalTitulo,
                                                                            'Sin titulo',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Color(
                                                                            0xFF4B5563),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.returntext(listaProfesionalesServiceDetailsRow.coverageAreas.toList()),
                                                                            'Sin zonas',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xFFFEB052),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listaProfesionalesServiceDetailsRow
                                                                              .averageRating
                                                                              .toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: const Color(0xFF4B5563),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            13.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF4B5563),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${valueOrDefault<String>(
                                                                            listaProfesionalesServiceDetailsRow.totalReviews?.toString(),
                                                                            '-',
                                                                          )} Reseñas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF6B7280),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (_model.orderby == 'Mas antiguos') {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceDetailsRow>>(
                                      future: ServiceDetailsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .containsOrNull(
                                              'categoria',
                                              '{${widget.categoriaid}}',
                                            )
                                            .overlapsOrNull(
                                              'coverage_areas',
                                              FFAppState().filtrozonacobertura,
                                            )
                                            .overlapsOrNull(
                                              'budget_no_charge',
                                              FFAppState().presupuesto,
                                            )
                                            .order('created_at',
                                                ascending: true),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServiceDetailsRow>
                                            listaProfesionalesServiceDetailsRowList =
                                            snapshot.data!;

                                        if (listaProfesionalesServiceDetailsRowList
                                            .isEmpty) {
                                          return const EmptyListServicesWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listaProfesionalesServiceDetailsRowList
                                                  .length,
                                          itemBuilder: (context,
                                              listaProfesionalesIndex) {
                                            final listaProfesionalesServiceDetailsRow =
                                                listaProfesionalesServiceDetailsRowList[
                                                    listaProfesionalesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'servicio_detalle',
                                                    queryParameters: {
                                                      'service': serializeParam(
                                                        listaProfesionalesServiceDetailsRow
                                                            .serviceId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: 342.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    listaProfesionalesServiceDetailsRow
                                                                        .professionalFoto!,
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          listaProfesionalesServiceDetailsRow
                                                                              .title!,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF1F2A37),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E7EB),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaProfesionalesServiceDetailsRow.professionalTitulo,
                                                                            'Sin titulo',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Color(
                                                                            0xFF4B5563),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.returntext(listaProfesionalesServiceDetailsRow.coverageAreas.toList()),
                                                                            'Sin zonas',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xFFFEB052),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        listaProfesionalesServiceDetailsRow
                                                                            .averageRating!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: const Color(0xFF4B5563),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            13.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF4B5563),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${listaProfesionalesServiceDetailsRow.totalReviews?.toString()} Reseñas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF6B7280),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (_model.orderby == 'Menor precio') {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceDetailsRow>>(
                                      future: ServiceDetailsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .containsOrNull(
                                              'categoria',
                                              '{${widget.categoriaid}}',
                                            )
                                            .overlapsOrNull(
                                              'coverage_areas',
                                              FFAppState().filtrozonacobertura,
                                            )
                                            .overlapsOrNull(
                                              'budget_no_charge',
                                              FFAppState().presupuesto,
                                            )
                                            .order('price', ascending: true),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServiceDetailsRow>
                                            listaProfesionalesServiceDetailsRowList =
                                            snapshot.data!;

                                        if (listaProfesionalesServiceDetailsRowList
                                            .isEmpty) {
                                          return const EmptyListServicesWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listaProfesionalesServiceDetailsRowList
                                                  .length,
                                          itemBuilder: (context,
                                              listaProfesionalesIndex) {
                                            final listaProfesionalesServiceDetailsRow =
                                                listaProfesionalesServiceDetailsRowList[
                                                    listaProfesionalesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'servicio_detalle',
                                                    queryParameters: {
                                                      'service': serializeParam(
                                                        listaProfesionalesServiceDetailsRow
                                                            .serviceId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: 342.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    listaProfesionalesServiceDetailsRow
                                                                        .professionalFoto!,
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          listaProfesionalesServiceDetailsRow
                                                                              .title!,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF1F2A37),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E7EB),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaProfesionalesServiceDetailsRow.professionalTitulo,
                                                                            'Sin titulo',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Color(
                                                                            0xFF4B5563),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.returntext(listaProfesionalesServiceDetailsRow.coverageAreas.toList()),
                                                                            'Sin zonas',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xFFFEB052),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        listaProfesionalesServiceDetailsRow
                                                                            .averageRating!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: const Color(0xFF4B5563),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            13.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF4B5563),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${listaProfesionalesServiceDetailsRow.totalReviews?.toString()} Reseñas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF6B7280),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (_model.orderby == 'Mayor precio') {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceDetailsRow>>(
                                      future: ServiceDetailsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .containsOrNull(
                                              'categoria',
                                              '{${widget.categoriaid}}',
                                            )
                                            .overlapsOrNull(
                                              'coverage_areas',
                                              FFAppState().filtrozonacobertura,
                                            )
                                            .overlapsOrNull(
                                              'budget_no_charge',
                                              FFAppState().presupuesto,
                                            )
                                            .order('price'),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServiceDetailsRow>
                                            listaProfesionalesServiceDetailsRowList =
                                            snapshot.data!;

                                        if (listaProfesionalesServiceDetailsRowList
                                            .isEmpty) {
                                          return const EmptyListServicesWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listaProfesionalesServiceDetailsRowList
                                                  .length,
                                          itemBuilder: (context,
                                              listaProfesionalesIndex) {
                                            final listaProfesionalesServiceDetailsRow =
                                                listaProfesionalesServiceDetailsRowList[
                                                    listaProfesionalesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'servicio_detalle',
                                                    queryParameters: {
                                                      'service': serializeParam(
                                                        listaProfesionalesServiceDetailsRow
                                                            .serviceId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: 342.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    listaProfesionalesServiceDetailsRow
                                                                        .professionalFoto!,
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          listaProfesionalesServiceDetailsRow
                                                                              .title!,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF1F2A37),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E7EB),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaProfesionalesServiceDetailsRow.professionalTitulo,
                                                                            'Sin titulo',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Color(
                                                                            0xFF4B5563),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.returntext(listaProfesionalesServiceDetailsRow.coverageAreas.toList()),
                                                                            'Sin zonas',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xFFFEB052),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        listaProfesionalesServiceDetailsRow
                                                                            .averageRating!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: const Color(0xFF4B5563),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            13.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF4B5563),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${listaProfesionalesServiceDetailsRow.totalReviews?.toString()} Reseñas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF6B7280),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (_model.orderby == 'Mejores reseñas') {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceDetailsRow>>(
                                      future: ServiceDetailsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .containsOrNull(
                                              'categoria',
                                              '{${widget.categoriaid}}',
                                            )
                                            .overlapsOrNull(
                                              'coverage_areas',
                                              FFAppState().filtrozonacobertura,
                                            )
                                            .overlapsOrNull(
                                              'budget_no_charge',
                                              FFAppState().presupuesto,
                                            )
                                            .order('average_rating'),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServiceDetailsRow>
                                            listaProfesionalesServiceDetailsRowList =
                                            snapshot.data!;

                                        if (listaProfesionalesServiceDetailsRowList
                                            .isEmpty) {
                                          return const EmptyListServicesWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listaProfesionalesServiceDetailsRowList
                                                  .length,
                                          itemBuilder: (context,
                                              listaProfesionalesIndex) {
                                            final listaProfesionalesServiceDetailsRow =
                                                listaProfesionalesServiceDetailsRowList[
                                                    listaProfesionalesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'servicio_detalle',
                                                    queryParameters: {
                                                      'service': serializeParam(
                                                        listaProfesionalesServiceDetailsRow
                                                            .serviceId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: 342.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    listaProfesionalesServiceDetailsRow
                                                                        .professionalFoto!,
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          listaProfesionalesServiceDetailsRow
                                                                              .title!,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF1F2A37),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFE5E7EB),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaProfesionalesServiceDetailsRow.professionalTitulo,
                                                                            'Sin titulo',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Color(
                                                                            0xFF4B5563),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.returntext(listaProfesionalesServiceDetailsRow.coverageAreas.toList()),
                                                                            'Sin zonas',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF4B5563),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xFFFEB052),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        listaProfesionalesServiceDetailsRow
                                                                            .averageRating!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: const Color(0xFF4B5563),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            13.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF4B5563),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${listaProfesionalesServiceDetailsRow.totalReviews?.toString()} Reseñas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: const Color(0xFF6B7280),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                );
                              }
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
      ),
    );
  }
}
