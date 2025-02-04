import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_profesionals/empty_profesionals_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'alertas_de_servicio_profesionales_model.dart';
export 'alertas_de_servicio_profesionales_model.dart';

/// Los servicios de los profesionales
class AlertasDeServicioProfesionalesWidget extends StatefulWidget {
  const AlertasDeServicioProfesionalesWidget({
    super.key,
    required this.idalerta,
  });

  final int? idalerta;

  @override
  State<AlertasDeServicioProfesionalesWidget> createState() =>
      _AlertasDeServicioProfesionalesWidgetState();
}

class _AlertasDeServicioProfesionalesWidgetState
    extends State<AlertasDeServicioProfesionalesWidget> {
  late AlertasDeServicioProfesionalesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertasDeServicioProfesionalesModel());

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
            'Profesionales',
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
                              Flexible(
                                child: FutureBuilder<
                                    List<InterestedProfessionalsRow>>(
                                  future:
                                      InterestedProfessionalsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'alerta_id',
                                      widget.idalerta,
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
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<InterestedProfessionalsRow>
                                        textInterestedProfessionalsRowList =
                                        snapshot.data!;

                                    return Text(
                                      '${textInterestedProfessionalsRowList.length.toString()} encontrados',
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
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 0.0),
                            child:
                                FutureBuilder<List<InterestedProfessionalsRow>>(
                              future: InterestedProfessionalsTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'alerta_id',
                                  widget.idalerta,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<InterestedProfessionalsRow>
                                    listaProfesionalesInterestedProfessionalsRowList =
                                    snapshot.data!;

                                if (listaProfesionalesInterestedProfessionalsRowList
                                    .isEmpty) {
                                  return const EmptyProfesionalsWidget();
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listaProfesionalesInterestedProfessionalsRowList
                                          .length,
                                  itemBuilder:
                                      (context, listaProfesionalesIndex) {
                                    final listaProfesionalesInterestedProfessionalsRow =
                                        listaProfesionalesInterestedProfessionalsRowList[
                                            listaProfesionalesIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'detalle_profesional',
                                            queryParameters: {
                                              'profesional': serializeParam(
                                                listaProfesionalesInterestedProfessionalsRow
                                                    .profesionalId,
                                                ParamType.String,
                                              ),
                                              'usuarioalertaid': serializeParam(
                                                listaProfesionalesInterestedProfessionalsRow
                                                    .alertaId,
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
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            width: 342.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (listaProfesionalesInterestedProfessionalsRow
                                                                    .foto !=
                                                                null &&
                                                            listaProfesionalesInterestedProfessionalsRow
                                                                    .foto !=
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              listaProfesionalesInterestedProfessionalsRow
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
                                                      padding:
                                                          const EdgeInsetsDirectional
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    '${listaProfesionalesInterestedProfessionalsRow.nombre} ${listaProfesionalesInterestedProfessionalsRow.apellido}',
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              const Color(0xFF1F2A37),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (listaProfesionalesInterestedProfessionalsRow
                                                                      .verified ??
                                                                  true)
                                                                const Icon(
                                                                  Icons
                                                                      .verified,
                                                                  color: Color(
                                                                      0xFF3E9AF0),
                                                                  size: 24.0,
                                                                ),
                                                            ],
                                                          ),
                                                          const Divider(
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFE5E7EB),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listaProfesionalesInterestedProfessionalsRow
                                                                        .professionalTitle,
                                                                    'Sin titulo',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF4B5563),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                Icons.star,
                                                                color: Color(
                                                                    0xFFFEB052),
                                                                size: 20.0,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listaProfesionalesInterestedProfessionalsRow
                                                                      .averageRating
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: const Color(
                                                                          0xFF4B5563),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              const SizedBox(
                                                                height: 13.0,
                                                                child:
                                                                    VerticalDivider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: Color(
                                                                      0xFF4B5563),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  '${listaProfesionalesInterestedProfessionalsRow.totalReviews?.toString()} Reseñas',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF6B7280),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
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
