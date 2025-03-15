import '';
import '/app_cliente/servicios/orderby/orderby_widget.dart';
import '/app_cliente/servicios/servicios_list_component/servicios_list_component_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_services/empty_list_services_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  static String routeName = 'servicios';
  static String routePath = '/servicios';

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
            fillColor: Color(0x004B39EF),
            icon: Icon(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 25.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (loggedIn)
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
                                        .neqOrNull(
                                          'professional_id',
                                          currentUserUid,
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
                                                  .primaryBackground,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ServiceDetailsRow>
                                        encontradoslogedinServiceDetailsRowList =
                                        snapshot.data!;

                                    return Text(
                                      '${encontradoslogedinServiceDetailsRowList.length.toString()} encontrados',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF1F2A37),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    );
                                  },
                                ),
                              if (!loggedIn)
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
                                                  .primaryBackground,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ServiceDetailsRow>
                                        encontradoslogedoutServiceDetailsRowList =
                                        snapshot.data!;

                                    return Text(
                                      '${encontradoslogedoutServiceDetailsRowList.length.toString()} encontrados',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF1F2A37),
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
                                              child: Container(
                                                height: 400.0,
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 7.0, 0.0),
                                          child: Text(
                                            'Filtros',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF6B7280),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        FaIcon(
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
                        if (loggedIn)
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
                                              )
                                              .overlapsOrNull(
                                                'budget_no_charge',
                                                FFAppState().presupuesto,
                                              )
                                              .neqOrNull(
                                                'professional_id',
                                                currentUserUid,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keyuy9_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
                                              )
                                              .overlapsOrNull(
                                                'budget_no_charge',
                                                FFAppState().presupuesto,
                                              )
                                              .neqOrNull(
                                                'professional_id',
                                                currentUserUid,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keykti_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
                                              )
                                              .overlapsOrNull(
                                                'budget_no_charge',
                                                FFAppState().presupuesto,
                                              )
                                              .neqOrNull(
                                                'professional_id',
                                                currentUserUid,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Key750_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
                                              )
                                              .overlapsOrNull(
                                                'budget_no_charge',
                                                FFAppState().presupuesto,
                                              )
                                              .neqOrNull(
                                                'professional_id',
                                                currentUserUid,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keylfu_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else if (_model.orderby ==
                                    'Mejores reseñas') {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
                                              )
                                              .overlapsOrNull(
                                                'budget_no_charge',
                                                FFAppState().presupuesto,
                                              )
                                              .neqOrNull(
                                                'professional_id',
                                                currentUserUid,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Key7zz_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                        if (!loggedIn)
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keyhs3_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keyj5a_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keywrs_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keyvdi_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else if (_model.orderby ==
                                    'Mejores reseñas') {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 0.0),
                                      child: FutureBuilder<
                                          List<ServiceDetailsRow>>(
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
                                                FFAppState()
                                                    .filtrozonacobertura,
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
                                          List<ServiceDetailsRow>
                                              listaProfesionalesServiceDetailsRowList =
                                              snapshot.data!;

                                          if (listaProfesionalesServiceDetailsRowList
                                              .isEmpty) {
                                            return EmptyListServicesWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProfesionalesServiceDetailsRowList
                                                    .length,
                                            itemBuilder: (context,
                                                listaProfesionalesIndex) {
                                              final listaProfesionalesServiceDetailsRow =
                                                  listaProfesionalesServiceDetailsRowList[
                                                      listaProfesionalesIndex];
                                              return ServiciosListComponentWidget(
                                                key: Key(
                                                    'Keyuy1_${listaProfesionalesIndex}_of_${listaProfesionalesServiceDetailsRowList.length}'),
                                                id: listaProfesionalesServiceDetailsRow
                                                    .serviceId!,
                                                headline:
                                                    listaProfesionalesServiceDetailsRow
                                                        .title!,
                                                titulo:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalTitulo!,
                                                zonas: functions.returntext(
                                                    listaProfesionalesServiceDetailsRow
                                                        .coverageAreas
                                                        .toList())!,
                                                foto:
                                                    listaProfesionalesServiceDetailsRow
                                                        .professionalFoto!,
                                                promedio:
                                                    listaProfesionalesServiceDetailsRow
                                                        .averageRating!,
                                                cantidadresenas:
                                                    listaProfesionalesServiceDetailsRow
                                                        .totalReviews!,
                                                verified:
                                                    listaProfesionalesServiceDetailsRow
                                                        .verified!,
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
