import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'servicio_detalle_screen_model.dart';
export 'servicio_detalle_screen_model.dart';

class ServicioDetalleScreenWidget extends StatefulWidget {
  const ServicioDetalleScreenWidget({
    super.key,
    required this.service,
  });

  final int? service;

  @override
  State<ServicioDetalleScreenWidget> createState() =>
      _ServicioDetalleScreenWidgetState();
}

class _ServicioDetalleScreenWidgetState
    extends State<ServicioDetalleScreenWidget> {
  late ServicioDetalleScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicioDetalleScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceDetailCompleteRow>>(
      future: ServiceDetailCompleteTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'service_id',
          widget.service,
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
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ServiceDetailCompleteRow>
            servicioDetalleScreenServiceDetailCompleteRowList = snapshot.data!;

        final servicioDetalleScreenServiceDetailCompleteRow =
            servicioDetalleScreenServiceDetailCompleteRowList.isNotEmpty
                ? servicioDetalleScreenServiceDetailCompleteRowList.first
                : null;

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
                  context.pop();
                },
              ),
              title: Text(
                'Detalles',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF374151),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [
                Visibility(
                  visible: servicioDetalleScreenServiceDetailCompleteRow
                          ?.suscripcionActiva ??
                      true,
                  child: Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: const Color(0x004B39EF),
                      icon: const Icon(
                        Icons.share,
                        color: Color(0xFF374151),
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await Share.share(
                          'nirby://nirby.com/servicioDetalle',
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 342.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.asset(
                                                    'assets/images/enrique.png',
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 0.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          'Enrique Gomez',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: const Color(
                                                                    0xFF1F2A37),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      if (servicioDetalleScreenServiceDetailCompleteRow
                                                              ?.suscripcionActiva ??
                                                          true)
                                                        const Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF3E9AF0),
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xFFE5E7EB),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          'Electricista',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: const Color(
                                                                    0xFF4B5563),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 50.0,
                                          buttonSize: 56.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: const Icon(
                                            Icons.people_alt,
                                            color: Color(0xFF1C2A3A),
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          '300 +',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF1C2A3A),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'chats',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF1C2A3A),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 50.0,
                                          buttonSize: 56.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: const FaIcon(
                                            FontAwesomeIcons.medal,
                                            color: Color(0xFF1C2A3A),
                                            size: 26.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          '22 años',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF1C2A3A),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'experiencia',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF1C2A3A),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 50.0,
                                          buttonSize: 56.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: const Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFF1C2A3A),
                                            size: 26.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          '4.8',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF1C2A3A),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'rating',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF1C2A3A),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 50.0,
                                          buttonSize: 56.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: const Icon(
                                            Icons.comment_sharp,
                                            color: Color(0xFF1C2A3A),
                                            size: 26.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '200',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF1C2A3A),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'reseñas',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF1C2A3A),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 25.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Sobre el servicio',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF1F2A37),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 8.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Reparación de sistemas eléctricos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF1C2A3A),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '¿Problemas con tu sistema eléctrico? Nuestro equipo de expertos está aquí para ayudarte. Ofrecemos un servicio profesional y confiable para reparar cualquier fallo eléctrico en tu hogar, negocio o industria. Desde interrupciones en el suministro hasta sistemas complejos de automatización, tenemos las herramientas y el conocimiento para diagnosticar y solucionar cualquier problema.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF6B7280),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 8.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '\$ 35.000',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF1C2A3A),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (servicioDetalleScreenServiceDetailCompleteRow
                                      ?.atiendenUrgencias ??
                                  true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE3F6E8),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.check,
                                                color: Color(0xFF2B7A4B),
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Se atienden urgencias 24hs.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF2B7A4B),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 8.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE3F2FD),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 15.0, 0.0),
                                            child: Text(
                                              servicioDetalleScreenServiceDetailCompleteRow
                                                          ?.budgetNoCharge
                                                          .firstOrNull ==
                                                      'Sin cargo'
                                                  ? 'Se realizan presupuestos sin cargo'
                                                  : 'Se realizan presupuestos con cargo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF1565C0),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 25.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Lugares donde trabajo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF1F2A37),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'CABA, Zona norte, Zona Sur',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF6B7280),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (servicioDetalleScreenServiceDetailCompleteRow
                                      ?.bestReviewStars !=
                                  null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 25.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Reseñas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF1F2A37),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'reviews_complete',
                                            queryParameters: {
                                              'profesionalId': serializeParam(
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.professionalId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Text(
                                          'Ver todas',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF6B7280),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (servicioDetalleScreenServiceDetailCompleteRow
                                      ?.bestReviewStars !=
                                  null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 10.0,
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 15.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        if (servicioDetalleScreenServiceDetailCompleteRow
                                                ?.professionalId ==
                                            currentUserUid) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Mismo usuario'),
                                                content: const Text(
                                                    'No podés iniciar un chat con vos mismo'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                        _model.conversacionExistente =
                                            await ConversationsTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'buyer_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'seller_id',
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.professionalId,
                                              )
                                              .eqOrNull(
                                                'servicio',
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.serviceId,
                                              ),
                                        );
                                        shouldSetState = true;
                                        if (_model.conversacionExistente !=
                                                null &&
                                            (_model.conversacionExistente)!
                                                .isNotEmpty) {
                                          context.pushNamed(
                                            'chatService',
                                            queryParameters: {
                                              'conversationId': serializeParam(
                                                _model.conversacionExistente
                                                    ?.firstOrNull?.id,
                                                ParamType.int,
                                              ),
                                              'recipentId': serializeParam(
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.professionalId,
                                                ParamType.String,
                                              ),
                                              'serviceId': serializeParam(
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.serviceId,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          _model.conversation =
                                              await ConversationsTable()
                                                  .insert({
                                            'conversation_members':
                                                functions.fromlistreturnarray(
                                                    currentUserUid,
                                                    servicioDetalleScreenServiceDetailCompleteRow
                                                        ?.professionalId),
                                            'servicio':
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.serviceId,
                                            'buyer_id': currentUserUid,
                                            'seller_id':
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.professionalId,
                                          });
                                          shouldSetState = true;

                                          context.pushNamed(
                                            'chatService',
                                            queryParameters: {
                                              'conversationId': serializeParam(
                                                _model.conversation?.id,
                                                ParamType.int,
                                              ),
                                              'recipentId': serializeParam(
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.professionalId,
                                                ParamType.String,
                                              ),
                                              'serviceId': serializeParam(
                                                servicioDetalleScreenServiceDetailCompleteRow
                                                    ?.serviceId,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                      },
                                      text: 'Contactar',
                                      options: FFButtonOptions(
                                        height: 48.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF1C2A3A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(55.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
  }
}
