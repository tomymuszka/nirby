import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detalle_profesional_model.dart';
export 'detalle_profesional_model.dart';

class DetalleProfesionalWidget extends StatefulWidget {
  const DetalleProfesionalWidget({
    super.key,
    required this.profesional,
    required this.usuarioalertaid,
  });

  final String? profesional;
  final int? usuarioalertaid;

  @override
  State<DetalleProfesionalWidget> createState() =>
      _DetalleProfesionalWidgetState();
}

class _DetalleProfesionalWidgetState extends State<DetalleProfesionalWidget> {
  late DetalleProfesionalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalleProfesionalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProfessionalDetailsRow>>(
      future: ProfessionalDetailsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'professional_id',
          widget.profesional,
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
        List<ProfessionalDetailsRow>
            detalleProfesionalProfessionalDetailsRowList = snapshot.data!;

        final detalleProfesionalProfessionalDetailsRow =
            detalleProfesionalProfessionalDetailsRowList.isNotEmpty
                ? detalleProfesionalProfessionalDetailsRowList.first
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
                  context.safePop();
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
                                                  child: Image.network(
                                                    detalleProfesionalProfessionalDetailsRow!
                                                        .foto!,
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
                                                          '${detalleProfesionalProfessionalDetailsRow.nombre} ${detalleProfesionalProfessionalDetailsRow.apellido}',
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
                                                      if (detalleProfesionalProfessionalDetailsRow
                                                              .suscripcionActiva ??
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
                                                          valueOrDefault<
                                                              String>(
                                                            detalleProfesionalProfessionalDetailsRow
                                                                .titulo,
                                                            'Sin titulo',
                                                          ),
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
                                          '${detalleProfesionalProfessionalDetailsRow.totalConversations?.toString()} +',
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
                                          '${detalleProfesionalProfessionalDetailsRow.anosexperiencia?.toString()} años',
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
                                          valueOrDefault<String>(
                                            detalleProfesionalProfessionalDetailsRow
                                                .averageRating
                                                ?.toString(),
                                            '0',
                                          ),
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
                                              valueOrDefault<String>(
                                                detalleProfesionalProfessionalDetailsRow
                                                    .totalReviews
                                                    ?.toString(),
                                                '0',
                                              ),
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
                              if (detalleProfesionalProfessionalDetailsRow
                                          .bestReviewClientNombre !=
                                      null &&
                                  detalleProfesionalProfessionalDetailsRow
                                          .bestReviewClientNombre !=
                                      '')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 50.0, 15.0, 0.0),
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
                                                detalleProfesionalProfessionalDetailsRow
                                                    .professionalId,
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
                              if (detalleProfesionalProfessionalDetailsRow
                                          .bestReviewClientNombre !=
                                      null &&
                                  detalleProfesionalProfessionalDetailsRow
                                          .bestReviewClientNombre !=
                                      '')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    height: 180.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    detalleProfesionalProfessionalDetailsRow
                                                        .bestReviewClientFoto!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    '${detalleProfesionalProfessionalDetailsRow.bestReviewClientNombre} ${detalleProfesionalProfessionalDetailsRow.bestReviewClientApellido}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              const Color(0xFF374151),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      detalleProfesionalProfessionalDetailsRow
                                                                          .bestReviewStars
                                                                          ?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              const Color(0xFF6B7280),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                RatingBar
                                                                    .builder(
                                                                  onRatingUpdate:
                                                                      (newValue) =>
                                                                          safeSetState(() =>
                                                                              _model.ratingBarValue = newValue),
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          const Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: Color(
                                                                        0xFFFEB052),
                                                                  ),
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  initialRating: _model
                                                                          .ratingBarValue ??=
                                                                      detalleProfesionalProfessionalDetailsRow
                                                                          .bestReviewStars!
                                                                          .toDouble(),
                                                                  unratedColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      18.0,
                                                                  glowColor: const Color(
                                                                      0xFFFEB052),
                                                                ),
                                                              ],
                                                            ),
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
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 10.0, 15.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      detalleProfesionalProfessionalDetailsRow
                                                          .bestReviewComment,
                                                      'Sin comentario',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF6B7280),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
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
                                                  detalleProfesionalProfessionalDetailsRow
                                                      .professionalId,
                                                )
                                                .eqOrNull(
                                                  'alerta_de_servicio',
                                                  widget.usuarioalertaid,
                                                ),
                                          );
                                          if (_model.conversacionExistente !=
                                                  null &&
                                              (_model.conversacionExistente)!
                                                  .isNotEmpty) {
                                            context.pushNamed(
                                              'chatAlerta',
                                              queryParameters: {
                                                'conversationId':
                                                    serializeParam(
                                                  _model.conversacionExistente
                                                      ?.firstOrNull?.id,
                                                  ParamType.int,
                                                ),
                                                'recipentId': serializeParam(
                                                  widget.profesional,
                                                  ParamType.String,
                                                ),
                                                'alertaId': serializeParam(
                                                  widget.usuarioalertaid,
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
                                                      detalleProfesionalProfessionalDetailsRow
                                                          .professionalId),
                                              'alerta_de_servicio':
                                                  widget.usuarioalertaid,
                                              'buyer_id': currentUserUid,
                                              'seller_id':
                                                  detalleProfesionalProfessionalDetailsRow
                                                      .professionalId,
                                            });

                                            context.pushNamed(
                                              'chatAlerta',
                                              queryParameters: {
                                                'conversationId':
                                                    serializeParam(
                                                  _model.conversation?.id,
                                                  ParamType.int,
                                                ),
                                                'recipentId': serializeParam(
                                                  widget.profesional,
                                                  ParamType.String,
                                                ),
                                                'alertaId': serializeParam(
                                                  widget.usuarioalertaid,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Contactar',
                                        icon: const Icon(
                                          Icons.chat,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF1C2A3A),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 40.0, 15.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await UsuariosAlertasTable().update(
                                            data: {
                                              'user_descarted_profesional':
                                                  true,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.usuarioalertaid,
                                            ),
                                          );
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Profesional descartado'),
                                                content: const Text(
                                                    'El profesional ha sido descartado con éxito'),
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
                                          context.safePop();
                                        },
                                        text: 'Descartar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFFFDE4E4),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFFD9534F),
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
      },
    );
  }
}
