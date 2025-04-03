import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'servicios_list_component_model.dart';
export 'servicios_list_component_model.dart';

class ServiciosListComponentWidget extends StatefulWidget {
  const ServiciosListComponentWidget({
    super.key,
    required this.id,
    required this.headline,
    required this.titulo,
    required this.zonas,
    required this.foto,
    required this.promedio,
    required this.cantidadresenas,
    required this.verified,
  });

  final int? id;
  final String? headline;
  final String? titulo;
  final String? zonas;
  final String? foto;
  final double? promedio;
  final int? cantidadresenas;
  final bool? verified;

  @override
  State<ServiciosListComponentWidget> createState() =>
      _ServiciosListComponentWidgetState();
}

class _ServiciosListComponentWidgetState
    extends State<ServiciosListComponentWidget> {
  late ServiciosListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiciosListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            ServicioDetalleWidget.routeName,
            queryParameters: {
              'service': serializeParam(
                widget.id,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        },
        child: Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            width: 342.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          widget.foto!,
                          width: 110.0,
                          height: 110.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget.headline,
                                      'Headline',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF1F2A37),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              if (widget.verified ?? true)
                                Icon(
                                  Icons.verified,
                                  color: Color(0xFF52ABFF),
                                  size: 24.0,
                                ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE5E7EB),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.titulo,
                                    'Title',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF4B5563),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF4B5563),
                                size: 14.0,
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    widget.zonas,
                                    'Sin zonas',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF4B5563),
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFEB052),
                                size: 20.0,
                              ),
                              Text(
                                formatNumber(
                                  widget.promedio,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                ).maybeHandleOverflow(
                                  maxChars: 3,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF4B5563),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              SizedBox(
                                height: 13.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${valueOrDefault<String>(
                                    widget.cantidadresenas.toString(),
                                    '-',
                                  )} Reseñas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF6B7280),
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
  }
}
